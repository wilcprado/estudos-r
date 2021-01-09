library(forcats)

# FORCATS SECTION ---------------------------------------------------------
#A factor is an integer vector with a levels attribute that stores
#a set of mappings between integers and categorical values. When you view a factor, R
#displays not the integers, but the values associated with them.

#INSPECT FACTORS
fct_count(f1)
fct_unique(iris$Species)
levels(iris$Species)

#COMBINE FACTORS
## fct_c
f1 <- factor(c("a", "b","c")) 
f2 <- factor(c("b", "a","c")) 
combine_factor<- fct_c(iris$Species,f1)
levels(combine_factor)

## fct_unify
###Standardize levels across a list of factors
fct_unify(list(f1,f2))



#CHANGE THE ORDER OF LEVELS
## fct_relevel
fct_relevel(f1,c('b','c','a'))

##fct_infreq
### (highest frequency first). 
f1<-factor(c('a','b','c','b'))
fct_infreq(f1)


##fct_inorder
### appear in the data
fct_inorder(f1)
fct_rev(f1)
fct_shift(f1)
fct_shuffle(f1)

#fct_reorder
ggplot(mtcars, aes(x=fct_reorder(as.factor(cyl), mpg), y=mpg)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("cyl")

#fct_reorder2

ggplot(mtcars, aes(x=fct_reorder2(as.factor(cyl), mpg,carb), y=mpg)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("cyl")


#CHANGE THE VALUE OF LEVELS
f1<- factor(c('a','b','c','c','b','b','v','k'))
f1<-fct_recode(f1,x='a',z='c',y='b')
f1

fct_relabel(f1,~paste0('v'=.x))

fct_anon(f1)

fct_collapse(f1,x=c('a','c'))

fct_lump(f1,n=2)
fct_lump_min(f1,min = 3)

fct_other(f1,keep=c('c','a'))

#ADD OR DROP LEVELS
f5 <- factor(c("a","b"),c("a","b","x"))
f6 <- fct_drop(f5)

x=fct_expand(f6,'j')
fct_count(fct_expand(f6,'j'))
fct_drop(x)
f7<- factor(c('a','z',NA))
fct_explicit_na(f7)
