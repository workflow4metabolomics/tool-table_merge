################################################################################################
# TABLE MERGE                                                                                  #
#                                                                                              #
# User: Galaxy                                                                                 #
# Starting date: 16-04-2015                                                                    #
# V-0.1: First version of merge code                                                           #
#                                                                                              #
#                                                                                              #
# Input files: dataMatrix ; Metadata file                                                      #
# Output files: dataMatrix ; Metadata file                                                     #
#                                                                                              #
################################################################################################

# Parameters (for dev)
if(FALSE){
  DM.name <- "dataMatrix_CleanIons_CleanEch.txt"
  meta.name <- "sampleMetadata_CleanEch.txt"
  metype <- "sample"
  output <- "Combined_${Metadata_in.name}"
}



tab.merge <- function(DM.name,meta.name,metype,output){
  # This function allows to merge the dataMatrix with one metadata table
  
  
  DM <- read.table(DM.name,header=TRUE,sep="\t")
  meta <- read.table(meta.name,header=TRUE,sep="\t")
  
  if(metype=="sample"){
    rownames(DM) <- DM[,1]
    DM <- DM[,-1]
    DM <- t(DM)
    DM <- data.frame(sample=row.names(DM),DM)
    rownames(DM) <- NULL
  }
  
  comb.data <- merge(x=meta,y=DM,by.x=1,by.y=1)
  
  
  write.table(comb.data,output,sep="\t",quote=FALSE,row.names=FALSE)
  
}



