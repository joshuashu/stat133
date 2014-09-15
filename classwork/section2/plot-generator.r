load('family.rda')

xran <- range(fweight)
yran <- range(fheight)
col.palette <- c('blue', 'red')
cols <- col.palette[as.numeric(fgender)]

plot(fweight, fheight, xlim=xran, ylim=yran, main='Family height v weight',
     xlab='weight', ylab='height', col=cols, pch=20)

legend('topleft', c('males', 'females'), col=c('blue', 'red'), pch=20)
