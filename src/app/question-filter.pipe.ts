import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'questionFilter'
})
export class QuestionFilterPipe implements PipeTransform {

  transform(value: any, arg1?: any, arg2?: any): any {
    return value.filter(item => item.label != arg1 && item.label != arg2);
  }

}
