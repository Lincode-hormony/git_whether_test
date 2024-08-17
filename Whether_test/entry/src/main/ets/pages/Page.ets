import { router } from '@kit.ArkUI'

class info{
  info:string=''
}

@Entry
@Component
struct CustomDialogUser {
  @State t:object=router.getParams()
  @State x:info=new info





  build() {
    Column() {

      Text(JSON.stringify(this.t))

      Button('click me')
        .onClick(() => {
          this.x.info=this.t['info']

        })
      Text(this.x.info)
  }
}}