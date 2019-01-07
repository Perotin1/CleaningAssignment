run_analysis <- function(){
  if("reshape" %in% rownames(installed.packages()) == FALSE) {install.packages("reshape")}
  library(reshape)
  x_train <- read.table("train/X_train.txt",comment.char = "") ##reads in training and test data sets
  x_test <- read.table("test/X_test.txt",comment.char = "")
  x <- rbind(x_train,x_test)
  ft_ind <- read.table("features.txt",comment.char = "")[,2] ##reads in descriptive variable names
  ft_ind_char <- as.character(ft_ind)
  m_st_cols <- grep("mean[^F]|std",ft_ind_char) ##finds mean and standard deviation variables
  colnames(x) <- ft_ind_char ##assigns descriptive variable names 
  m_st_x <- x[,m_st_cols] ##extracts mean and standard deviation variables
  y_train <- as.numeric(readLines("train/y_train.txt")) ##reads in activity index
  y_test <- as.numeric(readLines("test/y_test.txt"))
  y <- c(y_train, y_test)
  act_lbl <- read.table("activity_labels.txt")[,2] ## reads in descriptive activity labels
  act_lbl_char <- as.character(act_lbl)
  activity <- factor(as.character(y), levels = c(1:6), labels = lapply(act_lbl_char,tolower))
  act_m_st_x <- cbind(activity,m_st_x) ##assigns descriptive activity labels
  s_test <- readLines("test/subject_test.txt")
  s_train <- readLines("train/subject_train.txt")
  subject_num <- as.numeric(c(s_train, s_test))
  subj_act_x <- cbind(subject_num,act_m_st_x) ##binds subject index to dataset
  out <- data.frame(measurement = factor(),subject_number = integer(),activity = factor(), average_value = numeric())
  for(i in 3:length(colnames(subj_act_x))){ ## loop to find variable average split by activity and subject
    r <- tapply(subj_act_x[,i], list(subj_act_x$subject_num,subj_act_x$activity), mean)
    m_r <- melt(r) 
    lab_m_r <- cbind(rep(colnames(subj_act_x)[i],times = 180),m_r)
    out <- rbind(out,lab_m_r)
  }
  out <- out[,c(3,2,1,4)] ##makes output dataset prettier
  out <- out[order(out[,1],out[,2]),]
  colnames(out) <- c("activity","subject_number", "measurement","average_value")
  write.table(out,"UCI_HAR_summary.txt",row.names = FALSE)
}