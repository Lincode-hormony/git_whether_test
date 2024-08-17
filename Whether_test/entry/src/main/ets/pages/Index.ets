


import HttpUtil from '../Util/HttpUtil'
import {DailyForecast} from '../Model/DataModel'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {

@State a:Array<DailyForecast>=[]
  @State b:DailyForecast=new DailyForecast()



  build() {
    Column(){
      // TextInput().onChange((v)=>{
      //   this.city=v
      // })
      Button('获取数据').onClick(()=>{

        router.pushUrl({
          url:'pages/Page',
          params:{
            info:'message'
          }
        })

      })


      //this.a=HttpUtil.GetData(encodeURIComponent(this.city))









    }
  }
}
