Return-Path: <SRS0=Xmdo=2S=oss.qualcomm.com=janaki.thota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83483C87FD3
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Aug 2025 17:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BF2CC4CEED; Wed,  6 Aug 2025 17:51:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88370C4CEE7
	for <linux-firmware@kernel.org>; Wed,  6 Aug 2025 17:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88370C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576Dh83i019692
	for <linux-firmware@kernel.org>; Wed, 6 Aug 2025 17:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=OZDDz0Xgi5Mi/VTxh1vPBm1kPWpQrcnlK4UzoC4r/ZY=; b=SW
	H0DNn0sPgkIDf1sVFhYFYn9F+xfnBO/rcl+FJfC0MjMdA+Wb0uSR5eXQD1srPkWP
	9zFo3NX4C2cX+w0U2g0cowS+ULzptBLWMWv7YiGa00OM0w7m54gPTwG8HPS/2M+X
	BLl4uJiWtT+e2Vhl6owY1itg1np4UgFcVqKgdluYB24bs6iXm/arokgY1Fe6UO+T
	arvZhZvpy7j+aXuujzymJGFuTHCWmogGL5+o1NH++vBulroOjlIIPHgXUavP4nGy
	X7r0VpcF2gU+pUxGv2UwTmmzIuoDN1y0EwpKT4RhDdxgbA+0AhZAbR56ALRIYYRj
	afConl2X/lOEIXITn2vQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6ukah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 06 Aug 2025 17:51:30 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-61b6991a446so125647eaf.2
        for <linux-firmware@kernel.org>; Wed, 06 Aug 2025 10:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754502689; x=1755107489;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZDDz0Xgi5Mi/VTxh1vPBm1kPWpQrcnlK4UzoC4r/ZY=;
        b=KxBcI0hS+jSu9aLFX1QHrCF9kilLVbbSYquWW4KxRowUFoFkkd4KirsF9Txaesv4RM
         z18drzn9KbtDh6rfQZNu54f8EHF4m/xaZSs+CZxd60165HAthvN7+QbRpyGMimwCHkwi
         4K1lx7Y2hNJyCgmlr96i2kSj3M3BbbboehPYqvdDSz4b5nAeXtmr4ZZZr/QcYM9bpKdv
         UjA5BkduzxTk4PO37bI7bFq8WagGWbJV8XMxRiqz3mx7584lykjViRbSorOL7pQjrokp
         2xn4jfUPoNL0mT7qHiarWvnRV8D+L/6PqnHx4UrGK9035W6uQmDs2BVNzg+74sfpPfCe
         7NfA==
X-Gm-Message-State: AOJu0Yw0dIPvPtA9D0lN25lCWILvJwSdRlpmKc5gCQrIgXoI3u1kpq8e
	4KEUIHH5lETIN87cztieRGbA0UbvrUTQwFQgY1vQ8q/FGdgbbgORzZGujzQxKQ1Q+Y1u9rFoAy7
	rf+/VMxOKfolcjUukaiSuvaOlh62IYhlrXPUodLwa6FjPs+HlDgN1vY3z/jf1Qk56mSe7qCX6Tm
	qHeC2ZaRMWB/QeOQOAWWglFYTL/24OU5mbfcOy6Q3qXFOhBLJU8pU=
X-Gm-Gg: ASbGncsVE7X0sFD68JY1ArlN1yjNdWKJQNvjN9zVllehKx/Y4A/1mOA4Djtn88x12aV
	bgOrHxP5BcU8Qgk5bhSQx7Mi/g2r0U7ka4i33yu7CBGbBWaLURzpAw9OlYkr3RRDMif0IA0rzYj
	QFB2kCTzfuw320rwCns49FRA==
X-Received: by 2002:a05:6820:1523:b0:615:b1e4:62e3 with SMTP id 006d021491bc7-61b5f0b1ee1mr2792265eaf.0.1754502689289;
        Wed, 06 Aug 2025 10:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcTY4Xtr1HsiGrNX2flSLqdNjDKz9YLxt9SDhLJSzBKdda5omY2PuYrApZ6QxC366GiwM2RCV+HaDObU6Un0E=
X-Received: by 2002:a05:6820:1523:b0:615:b1e4:62e3 with SMTP id
 006d021491bc7-61b5f0b1ee1mr2792241eaf.0.1754502688917; Wed, 06 Aug 2025
 10:51:28 -0700 (PDT)
MIME-Version: 1.0
From: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 23:21:17 +0530
X-Gm-Features: Ac12FXwAKzHckWMFmy64TDZv1MLFehgKI42DcS0w9oQV6p3g910Cl2SME56awRI
Message-ID: <CAPiVHHhZYkO=0C3b4LLTUKFyFgYeZcek-hL4NJ3ZH3-dUQ1xjQ@mail.gmail.com>
Subject: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: hbandi@qti.qualcomm.com, mohamull@qti.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Content-Type: multipart/alternative; boundary="00000000000087e04c063bb5fdec"
X-Proofpoint-ORIG-GUID: jjEfxAn40mP4KCvcXB_di4R_RUP9K3gz
X-Proofpoint-GUID: jjEfxAn40mP4KCvcXB_di4R_RUP9K3gz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX3hTp862binqx
 8nhcVGb7wph/T/kfkID9bSd+kEVkpxSj8lg77xXKuuOfF/GBsqXT00nUo6LQeCLF6XAkJzOugQ7
 Enq/wPinszM0QqgKGQJ57vRS50GxSZ2KZ7alE4cIkHpcuM98Tr2ej7R4FfAAgnKeKcpn2o7zRMf
 2/Xit9+rLuYQ40Jow+vIrRx6DW3gLLoipmmDp0B6VufjOdXOshvrsTa+Ur2rMP3D68D3mPJBR1i
 52wZF5feHGzurqgTzjPcbg0a3v3BRY8dIKgr+Tn07Dbuo0pRGg5jxb54/WbLLAsR189F87DiNhM
 P9ECjhohu0/YclYxWpfUWVL3sLKVV1WYv47kWCGg/vuqA+fKeSpp/BZ47di4erS46OV+TkJllgP
 QDk+ffnK
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=68939622 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8
 a=kc7OuL9BXxg9jQfbWSUA:9 a=QEXdDO2ut3YA:10 a=aq_wMClzqUt03rhzUoQA:9
 a=Jy8yVFRzd00Pb57b:21 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

--00000000000087e04c063bb5fdec
Content-Type: text/plain; charset="UTF-8"

Hi linux-firmware maintainers,

 Here's a pull request for bluetooth firmware. Please let me know if
 you have any problems.

The following changes since commit b6b0b15278c76bbc1b7aaf17e706734d4be28e00:

  Merge branch 'amd-staging' into 'main' (2025-08-05 13:39:15 +0000)

are available in the Git repository at:

  https://github.com/quicjathot/bt_msl_fw_1.1.3_00091.git HEAD

for you to fetch changes up to d7925ab31e9406a0416bec96d2d1e6b25aba6bc7:

  qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
(2025-08-06 20:35:08 +0530)

----------------------------------------------------------------
Janaki Ramaiah Thota (1):
      qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091

Thanks,
 Janakiram

--00000000000087e04c063bb5fdec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi linux-firmware maintainers,<br><br>=C2=A0Here&#39;=
s a pull request for bluetooth firmware. Please let me know if <br>=C2=A0yo=
u have any problems.</div><div><br></div><div>The following changes since c=
ommit b6b0b15278c76bbc1b7aaf17e706734d4be28e00:</div><br>=C2=A0 Merge branc=
h &#39;amd-staging&#39; into &#39;main&#39; (2025-08-05 13:39:15 +0000)<br>=
<br>are available in the Git repository at:<br><br>=C2=A0 <a href=3D"https:=
//github.com/quicjathot/bt_msl_fw_1.1.3_00091.git">https://github.com/quicj=
athot/bt_msl_fw_1.1.3_00091.git</a> HEAD<br><br>for you to fetch changes up=
 to d7925ab31e9406a0416bec96d2d1e6b25aba6bc7:<br><br>=C2=A0 qca: Update Blu=
etooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091 (2025-08-06 20:35:08 +05=
30)<br><br>----------------------------------------------------------------=
<br>Janaki Ramaiah Thota (1):<br>=C2=A0 =C2=A0 =C2=A0 qca: Update Bluetooth=
 WCN6750 1.1.3-00069 firmware to 1.1.3-00091<br><br><div>Thanks,</div>=C2=
=A0Janakiram<br><br></div>

--00000000000087e04c063bb5fdec--
