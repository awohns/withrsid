target_list <- list.files(path="/ebc_data/awwohns/selection/getting_1000g_refs/allele_freqs/allelefreqs", pattern = "\\.frq$", full.names=TRUE)
thousandg_list <- list.files(path="/ebc_data/awwohns/selection/getting_1000g_refs/gbr_vcfs/gbr_chrs", pattern = "\\.vcf$", full.names=TRUE)
file_list <- list()

for (i in 1:22) {
        #file_list[[i]] <- target_list[grep(paste0("/",i,"_"),target_list)]
        file_list[[i]] <- cbind(target_list[grep(paste0("chr",i,"\\."),target_list)], thousandg_list[grep(paste0("chr",i,"\\."),thousandg_list)])
        #print(target_list[grep(paste0("^",i,"_"),target_list)])
        #print(thousandg_list[grep(paste0("chr",i,"\\."),thousandg_list)])
        #print("onelinedone")
}
print(target_list)
df  <- data.frame(matrix(unlist(file_list), nrow=22, byrow=T))
write.table(df, "rsidsandfreqs.txt",  sep="\t",row.names=FALSE,col.names=FALSE)
