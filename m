Return-Path: <SRS0=Iev/=GT=techfortunedb.com=natalie.mills@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FADC4167B
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Nov 2023 13:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05815C433C9; Mon,  6 Nov 2023 13:44:42 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0DF70C433C7
	for <linux-firmware@kernel.org>; Mon,  6 Nov 2023 13:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0DF70C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=techfortunedb.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=techfortunedb.com
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-3b2e308a751so2247699b6e.0
        for <linux-firmware@kernel.org>; Mon, 06 Nov 2023 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=techfortunedb.com; s=google; t=1699278280; x=1699883080; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3BCvd73ob5C64uRTN5GSAZcFL370/4cKHYhankbS6Cg=;
        b=kXCbRVXWXP2hmq8kapfpf0BdfRQbkDQ7jkvT9HWYSDBe/aPfHWLR12tTmTT1za7cqh
         h15eYQKDiJXEopUV/isnC5fqLr4HHe5DVVNqUaafnG1pI4Bbu/M7cfAHyI5Crowj1BIV
         35/fe4OFP9lg8YemMLCHaxd4NjLN1YbAPfwavoy7dqZVfn7cYSRIuQ0hTC5XTAH4cvf6
         HUpZ7tgRIoydTlB2agpXIDxhiCgKq1aa8HeSb7u5bHx8sfWUh0G2wwEKs8sEbWUFJBis
         lSoBjLMmmKllDmKcJjDeQZIVaoGzxulvC+yvvuGrsfCzW5/l3eKqh+goj4UYAXDMF13Q
         3zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699278280; x=1699883080;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BCvd73ob5C64uRTN5GSAZcFL370/4cKHYhankbS6Cg=;
        b=e+sJML84gsr5+YS2EcLvMg5EfIh5svggddf7uRHso6lOzL5mgidQv/HOc2GTxh7YHw
         e/nULZS9Oc6lTgrFA+OXmX+aq5srbDUPqAz2sK0FAdbz64elMj/Gj0LjyJj5GlJTTIp6
         /KijH6/+YTsWhcRdAPNW0uNNfbEhv+vFMoIQb00RzsTdddz4bptOTeOw30WLJ9EvlSFF
         6iRRtrtp2220STGy1S474YDEYDf+dpNcP3ElxcaRcVh8QKVF/krWs386I78IGForAhsk
         HS3+iUDIJ2yGag0OuxJnkoskPYqC1SaBKPlxgz3v02lvqaut9CAe5OQrOQxdD2OgWxMP
         yM0A==
X-Gm-Message-State: AOJu0YwSpeJ4zo+mtYOPF+oFjC4P9/yjlB4R/fyD5fvwzk37buPwVU9b
	gfhUVUdJjc0MBxTIIQDNX/ivs2jOpqYQkWK9Wi0oHQ==
X-Google-Smtp-Source: AGHT+IFRoxNLwfw9OWNXVpI17rbAjzibUzAv2hsIbcAKzDlDfMdty2n6ICnSRM6gS661RucDQgJdvYm9hcnG7g02nsU=
X-Received: by 2002:a05:6808:23d2:b0:3a8:6a40:7dc0 with SMTP id
 bq18-20020a05680823d200b003a86a407dc0mr6029655oib.18.1699278280070; Mon, 06
 Nov 2023 05:44:40 -0800 (PST)
MIME-Version: 1.0
From: Natalie Mills <natalie.mills@techfortunedb.com>
Date: Mon, 6 Nov 2023 19:14:15 +0530
Message-ID: <CAEZg4Ukzj7kahTJidp-tVdhNLV+nb352oWwDEibp2m=udW5PFA@mail.gmail.com>
Subject: Imex America 2023 Attendees Info (Thanks Giving Offer)
List-Id: <linux-firmware.lore.kernel.org>
To: lerestaurantw@warwickhotels.com, lerisha@wesgro.co.za, lermini@libero.it, 
	lesley@iam.net.ma, lesley@tallship.com.sg, lesleysanchez@complete-tours.com, 
	leslie.miller@marriott.com, leslie.potter@peabodymemphis.com, 
	leslie.weil@moxysouthbeach.com, leslie-ann@capecodchamber.org, 
	letsgetplanned@gmail.com, letters@thetimes.co.uk, 
	leukerm@messe-duesseldorf.de, levant@islanddmc.com, levycatering@wcd.org, 
	lewisglenn@seaisland.com, lexis.gongora@hhmlp.com, lfagan@nacacnet.org, 
	lfarber@santafeproperties.com, lfarrell@destinationtoronto.com, 
	lfella@flyevv.com, lfrancoeur@convention.qc.ca, lgallagher@omnihotels.com, 
	lgarcia@experiencekissimmee.com, lgarcia@ividmc.travel, 
	lgatp.concierge@hyatt.com, lgay@cliffamily.com, lgbtq2023@arinex.com.au, 
	lgeorge@ajshotels.com, lgmstore@legends.net, lgo@gotosito.it, 
	lgodfrey@adaremanor.com, lgomez@travelsalem.com, lguidry@theadvertiser.com, 
	lhadley@thealfondinn.com, lharlib@pacbell.net, lharrigan@bvitourism.com, 
	lheggarty@galgorm.com, lhernandez@destinationhotels.com, 
	lhernandez@vancouverconventioncentre.com, lherrera@panamazingdmc.com, 
	lhinchman@3dcruisepartners.com, lhn@parken.dk, lhs@tourod.com, 
	lhuffstutler@guesthousegraceland.com, lhughes@mjp.com, lia.silva@hfhotels.com, 
	liaison.sud@sasktel.net, libertas@rixos.com, library.programs@mygulfport.us, 
	liccet@nassftravel.com, licensing@hrp.org.uk, 
	licitaciones@barilocheturismo.gob.ar, lidia@principalge.com, 
	lidorental@fritzduda.com, lidymabelc@gmail.com, life@life-edu.org, 
	liftone@rof.net, lifttickets@sunvalley.com, 
	lightandbuild@uae.messefrankfurt.com, light-building@messefrankfurt.com, 
	lilakresna@conradbali.com, liliana.rivera@visitdallas.com, 
	liliana.woicik@aesa.com.ar, liliane@biosolvit.com, 
	lilly.mannerswood@flightcentre.com.hk, lilnote@sunlinc.net, 
	limbrogno@mccno.com, limocar300@gmail.com, lina.padilla@farandahotels.com, 
	lina.patino@movichhotels.com, lincolnmilitary@lpsi.com, 
	linda.abdulhay@atlantisdubai.com, linda.beltran@omnihotels.com, 
	linda.covert@flydenver.com, linda.dimeglio@ihg.com, linda@roundhill.com, 
	lindab@calgary-convention.com, lindiwer@icc.co.za, 
	lindsay.ford@zermattresort.com, lindsay.srednicki@langhamhotels.com, 
	lindsay@desilvadmc.com, lindsay@ishtayoga.com, lindsay@washington.org, 
	lindsey.barnes@nationalww2museum.org, lindsey.butcher@pacificahotels.com, 
	lindsey.dollahon@andaz.com, lindsey.thorpe@visitmalta.com, 
	lindsey.washkoviak@brushcreekranch.com, lindsey@isontravel.com, 
	lindsey@visitcos.com, linfo@cassatatravel.it, linfo@essenceofsicily.com, 
	lingeswaran.muruganandam@radissonblu.com, linux-firmware@kernel.org, 
	lion.naama@gmail.com, lionettiangelo@hotmail.com, lipperte@pebblebeach.com, 
	lirvin@georgiaaquarium.org, lis@cititravel.pt
Content-Type: multipart/alternative; boundary="000000000000422c7d06097c0ed6"

--000000000000422c7d06097c0ed6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,



This is an outstanding offer for *Imex America 2023 Exhibitors*!



I am writing to check if you would be interested in acquiring the list of
attendees for your marketing and sales initiatives.



This is an opportunity to acquire a list of *45,786 *attendee=E2=80=99s inf=
ormation
details for a robust marketing campaign which will eventually help you
convert the compiled leads into phenomenal sales deals.



Currently we are having a *=E2=80=9CThanks Giving Offers=E2=80=9D *on all i=
mmediate
purchases where you can avail the same list at much lesser price.



*List Contains*: *Name, Title, Email, Phone, Company Name, Physical
Address, City, State, Zip Code, Country, Web Address, Employee Size,
Revenue Size and Industry.*



Please revert with your interest to get you connected with our Business
Development Manager, who will send out the counts and pricing for your
review.





*Regards, *


*Natalie Mills Marketing and Communications*



                                         To opt out, please answer with
Remove in the Subject Line.

--000000000000422c7d06097c0ed6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.=
0001pt;font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"color:=
rgb(31,78,121)">Hi,</span><span style=3D"font-size:12pt;font-family:&quot;T=
imes New Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">=
=C2=A0</span><span style=3D"font-size:12pt;font-family:&quot;Times New Roma=
n&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">T=
his is an outstanding offer
for=C2=A0<b>Imex America 2023 Exhibitors</b>!</span><span style=3D"font-siz=
e:12pt;font-family:&quot;Times New Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">=
=C2=A0</span><span style=3D"font-size:12pt;font-family:&quot;Times New Roma=
n&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">I=
 am writing to check if you
would be interested in acquiring the list of attendees for your marketing a=
nd
sales initiatives.</span><span style=3D"font-size:12pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">=
=C2=A0</span><span style=3D"font-size:12pt;font-family:&quot;Times New Roma=
n&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">T=
his is an opportunity to
acquire a list of=C2=A0<b>45,786=C2=A0</b>attendee=E2=80=99s information de=
tails for a
robust marketing campaign which will eventually help you convert the compil=
ed
leads into phenomenal sales deals.</span><span style=3D"font-size:12pt;font=
-family:&quot;Times New Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">=
=C2=A0</span><span style=3D"font-size:12pt;font-family:&quot;Times New Roma=
n&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">C=
urrently we are having
a=C2=A0<b>=E2=80=9CThanks Giving Offers=E2=80=9D=C2=A0</b>on all immediate =
purchases where you
can avail the same list at much lesser price.</span><span style=3D"font-siz=
e:12pt;font-family:&quot;Times New Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">=
=C2=A0</span><span style=3D"font-size:12pt;font-family:&quot;Times New Roma=
n&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><b><span style=3D"color:rgb(31,78,121)=
">List Contains</span></b><span style=3D"color:rgb(31,78,121)">:=C2=A0<b>Na=
me, Title, Email, Phone, Company Name,
Physical Address, City, State, Zip Code, Country, Web Address, Employee Siz=
e,
Revenue Size and Industry.</b></span><span style=3D"font-size:12pt;font-fam=
ily:&quot;Times New Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><b><span style=3D"color:rgb(31,78,121)=
">=C2=A0</span></b><span style=3D"font-size:12pt;font-family:&quot;Times Ne=
w Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">P=
lease revert with your
interest to get you connected with our Business Development Manager, who wi=
ll
send out the counts and pricing for your review.</span><span style=3D"font-=
size:12pt;font-family:&quot;Times New Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">=
=C2=A0</span><span style=3D"font-size:12pt;font-family:&quot;Times New Roma=
n&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><b><span style=3D"color:rgb(31,78,121)=
">Regards,<br>
<br>
</span></b><span style=3D"font-size:12pt;font-family:&quot;Times New Roman&=
quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><b><span style=3D"color:rgb(31,78,121)=
">Natalie Mills<br>
Marketing and Communications</span></b><span style=3D"font-size:12pt;font-f=
amily:&quot;Times New Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><b><span style=3D"color:rgb(31,78,121)=
">=C2=A0</span></b><span style=3D"font-size:12pt;font-family:&quot;Times Ne=
w Roman&quot;,serif"></span></p>

<p class=3D"gmail-wordsection1" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif"><span style=3D"color:rgb(31,78,121)">=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0</span><span style=3D"color:rgb(189,215,238)">To opt o=
ut, please answer with Remove in the Subject
Line.</span><span style=3D"font-size:12pt;font-family:&quot;Times New Roman=
&quot;,serif"></span></p></div>

--000000000000422c7d06097c0ed6--
