function selectLocation(theCity, theJobs){
  return { type: "SWITCH_LOCATION", city: theCity, jobs: theJobs };
}
// window.selectLocation = selectLocation;
export default selectLocation;
