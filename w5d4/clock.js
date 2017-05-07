class Clock {
  constructor() {
    const date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }
  run(){
    console.log(this);
    setInterval(this._tick.bind(this),1000);
  }
  _tick() {
    console.log(this);
    this.increment_seconds();
    this.printTime();
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }

  increment_seconds(){
    this.seconds++;
    if(this.seconds === 60){
      this.seconds = 0;
      this.increment_minutes();
    }
  }

  increment_minutes(){
    this.minutes ++ ;
    if(this.minutes === 60){
      this.minutes = 0;
      this.increment_hours();
    }

  }

  increment_hours(){
    this.hours ++ ;
    if(this.hours === 24){
      this.hours = 0;
    }
  }

}

const clock = new Clock();
clock.run();
