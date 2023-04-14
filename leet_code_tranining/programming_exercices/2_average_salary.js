


var average = function(salary) {

    let minValue = Math.min(...salary);
    let maxValue = Math.max(...salary);
    console.log(`minValue ${minValue} maxValue: ${maxValue}`)
    let total = 0;
    for (let i = 0; i<salary.length; i++) {
        sal = salary[i]
        if (sal == minValue || sal ==maxValue){
            continue;
        }
        console.log(`adding ${sal}`)
        total += sal
        
    }
    result = total / (salary.length - 2)
    return result.toFixed(5)
};

if (require.main === module) {

  
    let inputs = [4000,3000,1000,2000];
    // 2500.00000
    console.log(average(inputs));
    // 2000.00000
    inputs = [1000,2000,3000];
    console.log(average(inputs));
    // 4750.00000
    inputs = [8000,9000,2000,3000,6000,1000];
    console.log(average(inputs));
  }