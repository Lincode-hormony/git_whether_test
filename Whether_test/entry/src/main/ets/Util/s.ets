import { http } from '@kit.NetworkKit'
import {city_data} from '../bean/GeoIp'




class HttpUtil {

  async GetData(num:string): Promise<string>{
    let httpRequest = http.createHttp();
    let b:string=''

    try{


      httpRequest.on('headersReceive', (header: Object) => {
        console.info('header: ' + JSON.stringify(header));
      });

      let result= await httpRequest.request(`https://geoapi.qweather.com/v2/city/lookup?location=${encodeURIComponent(num)}&key=a38f3cd7ca1346d4a1896c1c6784ddd1`, {
        method: http.RequestMethod.GET,
      })
      let a:Promise<city_data>=JSON.parse(result.result.toString())
      a.then((v)=>{
        b=v.location[0].id
      })




      return b
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