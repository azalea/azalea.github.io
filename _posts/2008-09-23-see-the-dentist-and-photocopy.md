---
layout: post
title: 看牙和复印
tags:
- everyday
- python
- study
- 看牙
- 美国
- 考试
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '666'
---
话说这两个看似八竿子打不着的词能够并列在一起，是因为我觉得它们都体现了美国人的一个特点：懒！换句话也可以说是人性化，再换句话也许是为人民服务。。

首先说看牙。我上周五第一次去看牙，从头到尾就只呆在一个病床上，拍X光片的仪器就在头顶上，显示X光片的电脑就在面前。记得在我家附近那破医院看牙（额。。天津医科大学口腔医院），拍片先要到3楼开票，再到1楼交钱，再到3口拍片，等20分钟再到3楼拿片，再拿给医生看。。我本来没牙疼的，折腾的都牙疼了。。

然后做了根管治疗，听起来很专业，我理解就是把我牙的神经都给毁了，然后填些别的东东。。医生给我打了麻药，又让我咬着一个东东，说是帮助我张嘴的，然后就没我事了，无聊得差点睡着。整个过程中，医生不停说：You are doing great! 感觉好像我很辛苦一样。。

不过pala说得很对，你花了那么多钱，当然会享受好的服务。一个小时的治疗竟然要900多刀，还好保险cover 80%，我只花了157刀。

下面就说复印。。今天去复印我做TA的那门课的考试卷子，老师Jenn很牛，手动做了4个不同版本的试卷，题目一样但是顺序不同，据说是防止作弊云云。我本来还发愁怎么区分这四种，万一搞乱了就死得很惨了。到了复印室发现有各种彩色的纸，Jenn就说你用不同的纸复印不同的试卷就行了，A卷用tan色，B卷用粉色，C卷用绿色，D卷用啥呢？我说用白色行不？Jenn说，you're so smart!!我汗。。然后就easy了，复印机可以设定从哪个tray里出纸，复印到单面还是双面，复印多少份，最牛的是，复印机可以设置是不是要装订起来，有4种订书钉的位置可供选择，我orz。。于是一按start按钮，我就只用到一旁发呆，等着一堆试卷复印装订好了摆在我面前。。

也许是我土星了，不过我第一次用可以自动装订的复印机，话说这个东东应该早就发明出来了。。

另外一点题外话，这边标准化考试的答题卡都是送到某机构（全称SCHREYER INSTITUTE FOR TEACHING EXCELLENCE)统一扫描的，扫描完会给授课教师一份试卷统计结果，包括成绩分布，试卷可靠性，每道题的正确率和有效性（有效性就是这道题答对和整个试卷获得高分的相关性，这个数字如果是正数且越接近1,则说明这道题用来衡量学生学习成绩越有效，如果是负数则说明这道题出得很垃圾，于是我很拭目以待这份试卷的统计。。）

但是问题来了，由于这次考试有4个版本的试卷，统计时会被认为是4次不同的考试，于是要向上述机构提供一份文件称作Item Unscrambler，标明版本A的第1题和版本B的第x题，版本C的第y题，版本D的第z题是同一题。于是我写了一段python代码，写得太垃圾就不贴出来了，源文件<a title="Unscrambler" href="http://azaleasays.com/wp-content/uploads/2008/09/unscrambler.py" target="_blank">unscrambler.py</a>。

另外考虑到Jenn手动把试题顺序搞成4个版本真是辛苦啊，于是又写了一个<a title="scrambler" href="http://azaleasays.com/wp-content/uploads/2008/09/scrambler.py" target="_blank">scrambler.py</a>来实现1个自动化。
