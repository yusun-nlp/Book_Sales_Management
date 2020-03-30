/*
 Navicat SQL Server Data Transfer

 Source Server         : BookSaleSystem
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Host           : 127.0.0.1:1433
 Source Catalog        : library
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

 Date: 29/04/2019 15:06:55
*/


-- ----------------------------
-- Table structure for Administrator
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Administrator]') AND type IN ('U'))
	DROP TABLE [dbo].[Administrator]
GO

CREATE TABLE [dbo].[Administrator] (
  [UserID] varchar(11) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Password] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [rights] varchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [gender] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [age] varchar(3) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Administrator] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Administrator
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[Administrator] ON
GO

INSERT INTO [dbo].[Administrator] ([UserID], [Password], [rights], [name], [gender], [ID], [age]) VALUES (N'17307130300', N'b7b21bd1657235182a8bd12dbdfd0d3d', N'normal', N'Yu', N'female', N'9', N'20'), (N'17307130311', N'b7b21bd1657235182a8bd12dbdfd0d3d', N'super', N'Jiayue', N'female', N'2', N'19'), (N'17307130312', N'b7b21bd1657235182a8bd12dbdfd0d3d', N'super', N'Yu', N'female', N'1', N'20')
GO

SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for bill
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[bill]') AND type IN ('U'))
	DROP TABLE [dbo].[bill]
GO

CREATE TABLE [dbo].[bill] (
  [billID] int  IDENTITY(1,1) NOT NULL,
  [status] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ISBN] float(53)  NOT NULL,
  [name] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [amount] varchar(5) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [prices] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [b_date] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[bill] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of bill
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[bill] ON
GO

INSERT INTO [dbo].[bill] ([billID], [status], [ISBN], [name], [amount], [prices], [b_date]) VALUES (N'1', N'out', N'2', N'数学、科学和认识论', N'5', N'25.00元', N'2019-4-12 10:15:50'), (N'2', N'in', N'1', N'古兰经注', N'1', N'298.00元', N'2019-4-12 8:14:21'), (N'3', N'out', N'78', N'回归分析', N'20', N'30.00元', N'2019-4-19 11:18:01'), (N'4', N'in', N'56', N'Learning From Data', N'5', N' 48.49元', N'2019-4-19 11:19:43')
GO

SET IDENTITY_INSERT [dbo].[bill] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[bookinfo]') AND type IN ('U'))
	DROP TABLE [dbo].[bookinfo]
GO

CREATE TABLE [dbo].[bookinfo] (
  [ISBN] float(53)  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [press] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [author] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [price] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [store] float(53)  NOT NULL
)
GO

ALTER TABLE [dbo].[bookinfo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of bookinfo
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[bookinfo] VALUES (N'1', N'古兰经注', N'出版信息：  中国社会科学出版社 / 2010-8 ', N'作者/译者： 伊本·凯西尔 / 孔德军 ', N' 298.00元', N'22'), (N'2', N'数学、科学和认识论', N'出版信息：  商务印书馆 / 2010-12', N'作者/译者： [匈] 拉卡托斯 / 林夏水 / 薛迪群 / 范建年 ', N'32.00元', N'19'), (N'3', N'微积分和数学分析引论-第1卷', N'出版信息：  世界图书出版公司 / 2008-1-1 / 79.00元', N'作者/译者： Richard Courant / Fritz John ', N'USD 122.00', N'38'), (N'4', N'Multiple View Geometry in Computer Vision', N'出版信息：  Cambridge University Press / 2004-4-19', N'作者/译者： Richard Hartley / Andrew Zisserman ', N'USD 89.99', N'60'), (N'5', N'Concrete Mathematics', N'出版信息：  Addison-Wesley Professional / 1994-3-10', N'作者/译者： Ronald L. Graham / Donald E. Knuth / Oren Patashnik ', N' 79.00元', N'112'), (N'6', N'复分析', N'出版信息：  人民邮电出版社 / 2009-7 / 79.00元', N'作者/译者： (美) 尼达姆 (Needham, T.) / 齐民友 ', N'49.00元', N'125'), (N'7', N'数学天书中的证明', N'出版信息：  高等教育出版社 / 2011-4-1', N'作者/译者： Martin Aigner / G.M.Ziegler / 冯荣权 / 宋春伟 / 宗传明 ', N' 48.00元', N'66'), (N'8', N'概率论教程', N'出版信息：  机械工业出版社 / 2010-4 / 49.00元', N'作者/译者： 钟开莱 ', N' 49.00元', N'36'), (N'9', N'神奇的数字世界', N'出版信息：  时代华文书局 / 2015-7-1 / 48.00元', N'作者/译者： 寄藤文平 / 胡晓丁 ', N' 48.00元', N'37'), (N'10', N'计算机视觉中的多视图几何', N'出版信息：  安徽大学出版社 / 2002年08月 / 50.0', N'作者/译者： 哈特利 ', N'50.00元', N'28'), (N'11', N'高中数学精编', N'出版信息： 郑日锋 编 / 2009-7 / 29.00元', N'作者/译者： ', N' 48.04元', N'36'), (N'12', N'计算机程序设计艺术 第2卷 半数值算法（第3版）（英文影印版）', N'出版信息：  清华大学出版社 / 2002-09-01 / 83.0', N'作者/译者： （美）Donald E.Knuth ', N' 48.05元', N'35'), (N'13', N'Pattern Recognition And Machine Learning', N'出版信息：  Springer / 2007-10-1 / USD 94.95', N'作者/译者： Christopher Bishop ', N' 48.06元', N'747'), (N'14', N'数学指南', N'出版信息：  科学出版社 / 2012-1-1 / 138.00元', N'作者/译者： [德]Eberhard Zeidler / [德]Wolfgang Hackbusch / [德]H.-R.Schwarz / 李文林 / 余德浩 / 陆柱家 ', N' 48.07元', N'46'), (N'15', N'Bayesian Reasoning and Machine Learning', N'出版信息：  Cambridge University Press / 2011 / $ 101.70', N'作者/译者： David Barber ', N' 48.08元', N'36'), (N'16', N'The Princeton Companion to Mathematics', N'出版信息：  Princeton University Press / 2008-9-28 / USD 99.50', N'作者/译者： Gowers, Timothy (EDT)/ Barrow-Green, June (EDT)/ Leader, Imre (EDT) ', N' 48.09元', N'60'), (N'17', N'Godel, Escher, Bach', N'出版信息：  Penguin / 2000-03-30 / GBP 18.99', N'作者/译者： Douglas R. Hofstadter ', N' 48.10元', N'133'), (N'18', N'实分析', N'出版信息：  世界图书出版公司 / 2007-1 / 39.00元', N'作者/译者： Elias M. Stein / Rami Shakarchi ', N' 48.11元', N'92'), (N'19', N'数理统计学教程', N'出版信息：  中国科学技术大学出版社 / 2009-7-1 / 38.00元', N'作者/译者： 陈希孺 ', N' 48.12元', N'55'), (N'20', N'微积分学教程（第3卷）', N'出版信息：  高等教育出版社 / 2006-1-1 / 53.00元', N'作者/译者： Г.М.菲赫金哥尔 ', N' 48.13元', N'178'), (N'21', N'经济分析基础', N'出版信息：', N'作者/译者：', N'48.14元', N'23'), (N'22', N'An Introduction to Probability Theory and Its Applications, Vol. 1, 3rd Edition', N'出版信息：  Wiley / 1968 / $143.89', N'作者/译者： William Feller ', N' 48.15元', N'25'), (N'23', N'具体数学', N'出版信息：  人民邮电出版社 / 2013-4-1 / 99.00元', N'作者/译者： Ronald L.Graham / Oren Patashnik / Donald E.Knuth / 张凡 / 张明尧 ', N' 48.16元', N'138'), (N'24', N'概率论与数理统计', N'出版信息：  中国科学技术大学出版社 / 2009-2 / 38.00元', N'作者/译者： 陈希孺 ', N' 48.17元', N'245'), (N'25', N'费恩曼物理学讲义（第1卷）', N'出版信息：  上海科学技术出版社 / 2005-06 / 85.00元', N'作者/译者： Richard P. Feynman / Robert B. Leighton / Matthew Sands / 王子辅、李洪芳、钟万蘅 ', N' 48.18元', N'1341'), (N'26', N'An Introduction to Statistical Learning', N'出版信息：  Springer / 2013-8-12 / USD 79.99', N'作者/译者： Gareth James / Daniela Witten / Trevor Hastie / Robert Tibshirani ', N' 48.19元', N'153'), (N'27', N'算法导论', N'出版信息：  高等教育出版社 / 2002-5 / 68.00元', N'作者/译者： [美] Thomas H. Cormen / Charles E. Leiserson / Ronald L. Rivest / Clifford Stein ', N' 48.20元', N'836'), (N'28', N'具体数学（英文版第2版）', N'出版信息：  机械工业出版社 / 2002-8 / 49.00元', N'作者/译者： [美] Ronald L. Graham / Donald E. Knuth / Oren Patashnik ', N' 48.21元', N'766'), (N'29', N'从一到无穷大', N'出版信息：  科学出版社 / 1978-11-01 / 0.68', N'作者/译者： （美）G·伽莫夫 / 暴永宁 ', N' 48.22元', N'645'), (N'30', N'Convex Optimization', N'出版信息：  Cambridge University Press / 2004-3-8 / USD 90.00', N'作者/译者： Stephen Boyd / Lieven Vandenberghe ', N' 48.23元', N'267'), (N'31', N'数学分析原理', N'出版信息：  机械工业出版社 / 2004-1 / 35.00元', N'作者/译者： Walter Rudin ', N' 48.24元', N'319'), (N'32', N'力学', N'出版信息：  高等教育出版社 / 2007-4 / 35.00元', N'作者/译者： П.Д.朗道 / Е.М.栗弗席兹 / 李俊峰 ', N' 48.25元', N'219'), (N'33', N'计算机程序设计艺术（第1卷）', N'出版信息：  国防工业出版社 / 2002-9 / 98.00元', N'作者/译者： [美] 唐纳德·E. 克努特 / 苏运霖 ', N' 48.26元', N'153'), (N'34', N'数值分析', N'出版信息：  人民邮电出版社 / 2010-1 / 79.00元', N'作者/译者： 索尔 (Timothy Sauer) / 吴兆金 / 王国英 / 范红军 ', N' 48.27元', N'50'), (N'35', N'Introduction to Linear Algebra, Fourth Edition', N'出版信息：  Wellesley Cambridge Press / 2009-2-10 / USD 87.50', N'作者/译者： Gilbert Strang ', N' 48.28元', N'217'), (N'36', N'数学在19世纪的发展（第一卷）', N'出版信息：  高等教育出版社 / 2010-3 / 68.00元', N'作者/译者： F.克莱因 / 齐民友 ', N' 48.29元', N'43'), (N'37', N'数学分析习题课讲义（上册）', N'出版信息：  高等教育出版社 / 2003-7 / 35.50元', N'作者/译者： 谢惠民等编 ', N' 48.30元', N'129'), (N'38', N'初等概率论（第4版）', N'出版信息：  世界图书出版公司 / 2010-1 / 45.00元', N'作者/译者： [美] 钟开莱 ', N' 48.31元', N'43'), (N'39', N'Godel''s Proof', N'出版信息：  NYU Press / 2001-10-1 / USD 25.00', N'作者/译者： Ernest Nagel / James R. Newman / Douglas R. Hofstadter ', N' 48.32元', N'31'), (N'40', N'高等数学引论（第一册）', N'出版信息：  高等教育出版社 / 2009-2-1 / 49.00元', N'作者/译者： 华罗庚 ', N' 48.33元', N'64'), (N'41', N'怎样解题', N'出版信息：  人民邮电出版社 / 2010-7 / 59.00元', N'作者/译者： 蔡茨 / 李胜宏 ', N' 48.34元', N'22'), (N'42', N'普林斯顿数学指南（第二卷）', N'出版信息：  科学出版社 / 2014-1 / 128.00', N'作者/译者： [英] Timothy Gowers / 齐民友 ', N' 48.35元', N'20'), (N'43', N'Principles of Mathematical Analysis', N'出版信息： Math / 1976-1-1 / $ 142.95', N'作者/译者： Walter Rudin / McGraw-Hill Science/Engineering', N' 48.36元', N'123'), (N'44', N'What Is Mathematics?', N'出版信息：  Oxford University Press / 1996-7-18 / GBP 11.99', N'作者/译者： Richard Courant / Herbert Robbins ', N' 48.37元', N'71'), (N'45', N'Computers and Intractability', N'出版信息：  W. H. Freeman / 1979-1-15 / $ 97.17', N'作者/译者： Michael R. Garey / David S. Johnson ', N' 48.38元', N'25'), (N'46', N'哥德尔、艾舍尔、巴赫', N'出版信息：  商务印书馆 / 1997-5 / 88.00元', N'作者/译者： [美] 侯世达 / 严勇 / 刘皓明 / 莫大伟 ', N' 48.39元', N'3393'), (N'47', N'算法导论（原书第2版）', N'出版信息：  机械工业出版社 / 2006-9 / 85.00元', N'作者/译者： [美] Thomas H.Cormen / Charles E.Leiserson / Ronald L.Rivest / Clifford Stein / 潘金贵 等 ', N' 48.40元', N'4401'), (N'48', N'微积分学教程（第一卷）', N'出版信息：  高等教育出版社 / 2006-1-1 / 45.00元', N'作者/译者： [俄罗斯] 菲赫金哥尔茨 ', N' 48.41元', N'482'), (N'49', N'The Elements of Statistical Learning', N'出版信息：  Springer / December 2008 / USD 89.95', N'作者/译者： Trevor Hastie / Robert Tibshirani / Jerome Friedman ', N' 48.42元', N'316'), (N'50', N'陶哲轩实分析', N'出版信息：  人民邮电出版社 / 2008年 / 69.00元', N'作者/译者： 陶哲轩 / 王昆扬 ', N' 48.43元', N'307'), (N'51', N'几何原本', N'出版信息：  译林出版社 / 2011-11 / 46.80元', N'作者/译者： (古希腊)欧几里得 / 兰纪正 / 朱恩宽 ', N' 48.44元', N'58'), (N'52', N'The Road to Reality', N'出版信息：  Knopf / 2005-2-22 / USD 40.00', N'作者/译者： Roger Penrose ', N' 48.45元', N'54'), (N'53', N'线性代数及其应用', N'出版信息：  人民邮电出版社 / 2009-1 / 55.00元', N'作者/译者： （美）拉克斯 / 傅莺莺 / 沈复兴 ', N' 48.46元', N'38'), (N'54', N'凸优化', N'出版信息：', N'作者/译者：', N'67.50元', N'46'), (N'55', N'数学分析（第一卷）', N'出版信息：  高等教育出版社 / 2006-6-1 / 59.00元', N'作者/译者： [俄]B.A.卓里奇 / 蒋铎 / 王昆扬 / 周美珂 / 邝荣雨 ', N' 48.48元', N'258'), (N'56', N'Learning From Data', N'出版信息：  AMLBook / 2012-3-27 / USD 48.00', N'作者/译者： Yaser S. Abu-Mostafa / Malik Magdon-Ismail / Hsuan-Tien Lin ', N' 48.49元', N'50'), (N'57', N'微积分学教程（第2卷）', N'出版信息：  高等教育出版社 / 2006-1 / 65.00元', N'作者/译者： F.M.菲赫金哥尔茨 / 徐献瑜 / 冷生明 / 梁文骐 ', N' 48.50元', N'244'), (N'58', N'Introduction to Algorithms', N'出版信息：  The MIT Press / 2001-9-1 / 85.00美元', N'作者/译者： Thomas H. Cormen / Charles E. Leiserson / Ronald L. Rivest / Clifford Stein ', N' 48.51元', N'318'), (N'59', N'Microeconomic Theory', N'出版信息：  Oxford University Press, USA / 1995-06-15 / $120.00', N'作者/译者： Andreu Mas-Colell / Michael D. Whinston / Jerry R. Green ', N' 48.52元', N'281'), (N'60', N'The Elements of Statistical Learning', N'出版信息：  Springer / 2003-07-30 / USD 89.95', N'作者/译者： T. Hastie / R. Tibshirani / J. H. Friedman ', N' 48.53元', N'102'), (N'61', N'Recursive Methods in Economic Dynamics', N'出版信息：  Harvard University Press / 1989-10-10 / USD 77.00', N'作者/译者： Nancy L. Stokey / Robert E. Lucas Jr. / Edward C. Prescott ', N' 48.54元', N'66'), (N'62', N'Numerical Optimization', N'出版信息：  Springer / 2000-04-28 / USD 84.95', N'作者/译者： Jorge Nocedal / Stephen Wright ', N' 48.55元', N'39'), (N'63', N'复变函数论方法', N'出版信息：  高等教育 / 2006-1 / 68.00元', N'作者/译者： [俄罗斯] 拉夫连季耶夫 / 沙巴特 ', N' 48.56元', N'39'), (N'64', N'Statistical Learning Theory', N'出版信息：  Wiley-Interscience / 1998-9-30 / USD 221.00', N'作者/译者： Vladimir N. Vapnik ', N' 48.57元', N'22'), (N'65', N'代数几何', N'出版信息：  世界图书出版公司 / 1999-11 / 82.00元', N'作者/译者： R.Hartshorne ', N' 48.58元', N'38'), (N'66', N'上帝掷骰子吗？', N'出版信息：  辽宁教育出版社 / 2011-4-1 / 36.80元', N'作者/译者： 曹天元 ', N' 48.59元', N'2402'), (N'67', N'什么是数学', N'出版信息：  复旦大学出版社 / 2012-1-1 / 43.00元', N'作者/译者： R•柯朗 / H•罗宾 / 左平 / 张饴慈 ', N' 48.60元', N'374'), (N'68', N'行为科学统计', N'出版信息：  中国轻工业出版社 / 2008-7 / 85.00元', N'作者/译者： [美] F. J. Gravetter / [美] L. B. Wallnau / 王爱民 / 李悦 ', N' 48.61元', N'317'), (N'69', N'普林斯顿数学指南（第一卷）', N'出版信息：  科学出版社 / 2014-1 / 128.00', N'作者/译者： [英] Timothy Gowers / 齐民友 ', N' 48.62元', N'29'), (N'70', N'计算机程序设计艺术（第1卷）', N'出版信息：  清华大学出版社 / 2002-9 / 80.00元', N'作者/译者： [美] Donald E. Knuth ', N' 48.63元', N'423'), (N'71', N'Hacker''s Delight', N'出版信息：  Addison-Wesley / 2002-7-27 / USD 59.99', N'作者/译者： Henry S. Warren Jr. ', N' 48.64元', N'53'), (N'72', N'Machine Learning', N'出版信息：  The MIT Press / 2012-8-24 / USD 90.00', N'作者/译者： Kevin P. Murphy ', N' 48.65元', N'158'), (N'73', N'Linear Algebra and Its Applications (Fourth Edition)', N'出版信息：  Brooks Cole / 2005-07-19 / USD 220.95', N'作者/译者： Gilbert Strang ', N' 48.66元', N'120'), (N'74', N'概率论沉思录', N'出版信息：  人民邮电出版社 / 2009-4 / 99.00元', N'作者/译者： 杰恩斯 ', N' 48.67元', N'119'), (N'75', N'笛卡儿几何', N'出版信息：  北京大学出版社 / 2008-11-1 / 38.00元', N'作者/译者： [法] 笛卡儿 / 袁向东 / 彭基相 / 管震湖 ', N' 48.68元', N'31'), (N'76', N'数学的统一性', N'出版信息：  大连理工大学出版社 / 2009-1 / 19.50元', N'作者/译者： 阿蒂亚 / 袁向东 ', N' 48.69元', N'87'), (N'77', N'微积分和数学分析引论（第一卷）', N'出版信息：  科学出版社 / 2005-2-1 / 48.00元', N'作者/译者： Richard Courant / Fritz John / 张鸿林 / 周民强 ', N' 48.70元', N'176'), (N'78', N'回归分析', N'出版信息：  社会科学文献出版社 / 2010-8 / 45.00元', N'作者/译者： 谢宇 ', N' 48.71元', N'113'), (N'79', N'Options, Futures and Other Derivatives (6th Edition)', N'出版信息：  Prentice Hall / 10 June, 2005 / $156.00', N'作者/译者： John C. Hull ', N' 48.72元', N'301'), (N'80', N'从微分观点看拓扑', N'出版信息：  人民邮电出版社 / 2008-10 / 20.00元', N'作者/译者： [美]John W.Milnor / 熊金城 ', N' 48.73元', N'52'), (N'81', N'Stochastic Calculus for Finance II', N'出版信息：  Springer / 2004-6 / USD 74.95', N'作者/译者： Steven Shreve ', N' 48.74元', N'162'), (N'82', N'微积分五讲', N'出版信息：  科学出版社 / 2004-1 / 14.00元', N'作者/译者： 龚昇 ', N' 48.75元', N'177'), (N'83', N'Probability and Computing', N'出版信息：  Cambridge University Press / 2005-01-31 / USD 66.00', N'作者/译者： Michael Mitzenmacher / Eli Upfal ', N' 48.76元', N'36'), (N'84', N'Introductory Functional Analysis with Applications', N'出版信息：  Wiley / 1989-2-23 / 1020.00 元', N'作者/译者： Erwin Kreyszig ', N' 48.77元', N'26'), (N'85', N'费马大定理', N'出版信息：  广西师范大学出版社 / 2013-1 / 39.80元', N'作者/译者： 西蒙·辛格 / 薛密 ', N' 48.78元', N'578'), (N'86', N'Logicomix', N'出版信息：  Bloomsbury USA / 2009-9-29 / USD 24.00', N'作者/译者： Apostolos Doxiadis / Christos H. Papadimitriou ', N' 48.79元', N'52'), (N'87', N'数理统计学简史', N'出版信息：  湖南教育出版社 / 2002 / 17.30元', N'作者/译者： 陈希孺 ', N' 48.80元', N'129'), (N'88', N'狭义与广义相对论浅说', N'出版信息：  北京大学出版社 / 2006-1 / 32.00元', N'作者/译者： [美] 爱因斯坦 / 杨润殷 ', N' 48.81元', N'652'), (N'89', N'哥德尔证明', N'出版信息：  中国人民大学出版社 / 2008-3 / 18.00元', N'作者/译者： 欧内斯特·内格尔（Ernest Nagel） / 詹姆士 R. 纽曼 （James R. Newman） / 陈东威 / 连永君 ', N' 48.82元', N'365'), (N'90', N'普林斯顿微积分读本', N'出版信息：  人民邮电出版社 / 2011-8 / 95.00元', N'作者/译者： 班纳 / 杨爽 / 高璞 / 赵晓婷 ', N' 48.83元', N'115'), (N'91', N'古今数学思想（二）', N'出版信息：  上海科学技术出版社 / 2002-8 / 35.00元', N'作者/译者： [美] 莫里斯·克莱因 / 朱学贤 等 ', N' 48.84元', N'391'), (N'92', N'托马斯微积分', N'出版信息：  高等教育出版社 / 2003-1-1 / 88.0', N'作者/译者： 芬尼 / 韦尔 / 焦尔当诺 / 叶其孝 / 王耀东 / 唐兢 ', N' 48.85元', N'260'), (N'93', N'Algorithms', N'出版信息：  Addison-Wesley Professional / 2011-3-9 / USD 79.99', N'作者/译者： Robert Sedgewick / Kevin Wayne ', N' 48.86元', N'124'), (N'94', N'古今数学思想（三）', N'出版信息：  上海科学技术出版社 / 2002-8 / 34.00元', N'作者/译者： [美] 莫里斯·克莱因 / 万伟勋 等 ', N' 48.87元', N'310'), (N'95', N'Algorithms', N'出版信息： Math / 2006-9-13 / $ 60.46', N'作者/译者： Sanjoy Dasgupta / Christos Papadimitriou / Umesh Vazirani / McGraw-Hill Science/Engineering', N' 48.88元', N'296'), (N'96', N'IBM SPSS数据分析与挖掘实战案例精粹', N'出版信息：  清华大学出版社 / 2013-2-22 / 64.00元', N'作者/译者： 张文彤 / 钟云飞 ', N' 48.89元', N'39'), (N'97', N'概率导论', N'出版信息：  人民邮电出版社 / 2009-12 / 69.00元', N'作者/译者： Dimitri P.Bertsekas / John N.Tsitsiklis / 郑国忠 / 童行伟 ', N' 48.90元', N'69'), (N'98', N'信息论、推理与学习算法', N'出版信息：  高等教育出版社 / 2006-7 / 59.00元', N'作者/译者： 麦凯 ', N' 48.91元', N'25'), (N'99', N'矩阵计算', N'出版信息：  人民邮电出版社 / 2011-3-1 / 89.00元', N'作者/译者： Gene H.Golub / Charles F.Van Loan / 袁亚湘 ', N' 48.92元', N'22'), (N'100', N'数学分析八讲', N'出版信息：', N'作者/译者：', N'64.01元', N'166')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for deal
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[deal]') AND type IN ('U'))
	DROP TABLE [dbo].[deal]
GO

CREATE TABLE [dbo].[deal] (
  [dealID] int  IDENTITY(1,1) NOT NULL,
  [ISBN] float(53)  NOT NULL,
  [name] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [price] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [amount] varchar(5) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [d_date] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[deal] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of deal
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[deal] ON
GO

INSERT INTO [dbo].[deal] ([dealID], [ISBN], [name], [price], [amount], [d_date]) VALUES (N'1', N'1', N'古兰经', N'298.00元', N'1', N'2019-4-12 8:14:21'), (N'2', N'56', N'Learning From Data', N' 48.49元', N'5', N'2019-4-19 11:19:43')
GO

SET IDENTITY_INSERT [dbo].[deal] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for order_form
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[order_form]') AND type IN ('U'))
	DROP TABLE [dbo].[order_form]
GO

CREATE TABLE [dbo].[order_form] (
  [orderID] int  IDENTITY(1,1) NOT NULL,
  [ISBN] float(53)  NOT NULL,
  [name] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [author] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [press] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [price] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [prices] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [amount] varchar(5) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [o_date] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[order_form] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of order_form
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[order_form] ON
GO

INSERT INTO [dbo].[order_form] ([orderID], [ISBN], [name], [author], [press], [price], [status], [prices], [amount], [o_date]) VALUES (N'1', N'108', N'欧几里得·几何原本', N'作者/译者： [古希腊] 欧几里得 / 兰纪正 / 朱恩宽 ', N'出版信息：  陕西科学技术出版社 / 2003-6', N'48.0元', N'success', N'25.00元', N'5', N'2019-4-12 10:15:50'), (N'2', N'34', N'数值分析', N'作者/译者： 索尔 (Timothy Sauer) / 吴兆金 / 王国英 / 范红军 ', N'出版信息：  人民邮电出版社 / 2010-1 / 79.00元', N' 48.27元', N'success', N'50.00元', N'9', N'2019-4-19 11:14:15'), (N'3', N'78', N'回归分析', N'作者/译者： 谢宇 ', N'出版信息：  社会科学文献出版社 / 2010-8 / 45.00元', N' 48.71元', N'success', N'30.00元', N'20', N'2019-4-19 11:17:58')
GO

SET IDENTITY_INSERT [dbo].[order_form] OFF
GO

COMMIT
GO


-- ----------------------------
-- Primary Key structure for table Administrator
-- ----------------------------
ALTER TABLE [dbo].[Administrator] ADD CONSTRAINT [PK__Administ__1788CCAC29435D0D] PRIMARY KEY CLUSTERED ([UserID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table bill
-- ----------------------------
ALTER TABLE [dbo].[bill] ADD CONSTRAINT [PK__bill__6D903F23157F24EA] PRIMARY KEY CLUSTERED ([billID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table bookinfo
-- ----------------------------
ALTER TABLE [dbo].[bookinfo] ADD CONSTRAINT [PK_bookinfo] PRIMARY KEY CLUSTERED ([ISBN])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table deal
-- ----------------------------
ALTER TABLE [dbo].[deal] ADD CONSTRAINT [PK__deal__1BC5A851B304B04F] PRIMARY KEY CLUSTERED ([dealID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table order_form
-- ----------------------------
ALTER TABLE [dbo].[order_form] ADD CONSTRAINT [PK__order_fo__0809337D22E5F7CD] PRIMARY KEY CLUSTERED ([orderID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

