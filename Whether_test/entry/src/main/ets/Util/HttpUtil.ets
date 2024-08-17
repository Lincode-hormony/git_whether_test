import { http } from '@kit.NetworkKit'
import {daily_data} from '../Model/DataModel'


class HttpUtil {



  async GetData(): Promise<daily_data>{
    let httpRequest = http.createHttp();

    try{


      httpRequest.on('headersReceive', (header: Object) => {
        console.info('header: ' + JSON.stringify(header));
      });

      let result= await httpRequest.request('https://devapi.qweather.com/v7/weather/3d?location=101010100&key=a38f3cd7ca1346d4a1896c1c6784ddd1', {
        method: http.RequestMethod.GET,
      })

      let a:daily_data=JSON.parse(result.result.toString())
      console.log('成功！')
      console.log('成功！'+ JSON.stringify(a))


      return a
    }catch (error){
      console.error("获取网络数据失败: " + JSON.stringify(error));
      throw new Error("获取网络数据失败: " + error.message);
    } finally {
      httpRequest.destroy()
    }


  }

}
let x:HttpUtil=new HttpUtil()
export default x