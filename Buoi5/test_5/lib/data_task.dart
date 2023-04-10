class DataTask {
  final String titleTask;
  final String startTime;
  final String endTime;
  final String dateDealine;
  bool isComplete = false;
  bool isFavorite = false;

  DataTask(
    this.titleTask,
    this.startTime,
    this.endTime,
    this.dateDealine,
    this.isComplete,
    this.isFavorite,
  );
}
