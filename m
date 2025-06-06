Return-Path: <SRS0=WlAD=YV=oss.qualcomm.com=zijun.hu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46A7C5B549
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Jun 2025 06:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7AA78C4CEF1; Fri,  6 Jun 2025 06:21:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96FF9C4CEEB
	for <linux-firmware@kernel.org>; Fri,  6 Jun 2025 06:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96FF9C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GtiOo028364
	for <linux-firmware@kernel.org>; Fri, 6 Jun 2025 06:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wN/G95VOz/MZVcVQUZZU45
	couHEifnkHLh8J+Hq9Mh4=; b=o6qCQxV2vAPb51nT4vrRGXEXAEkh4QY5eTh8Xs
	sz+TGBz7dGunVIfdjIFKdBHzynQwblpXQ93oQLxxn/Ghuu7Cmh8Otm9fQzX1QAOb
	AyfKDITjXPDf1bwHP5GADj96+J2FmE51FhwVSdo+gPH5/wI9e2WnmW+Yt3TDKwvv
	o92zr6UOEiOBtiI/OW7v76QaDCqWni1PUhBCt2BhCV9y13x1QSmL4L2AGOcMi8Bg
	JgvCuHbgUyP8jHuwadbJhp5Q1uUUTu0BIZHomp8aO5/odF56Fj8bn4S1wtwyoe1u
	iDqh6B/gr5qvSXxJF0MeWf8SfDPn3S1vsfzh1FY/jI2KTDHA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8num1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Jun 2025 06:21:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74815f8683aso156212b3a.2
        for <linux-firmware@kernel.org>; Thu, 05 Jun 2025 23:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749190870; x=1749795670;
        h=content-transfer-encoding:subject:cc:to:content-language:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wN/G95VOz/MZVcVQUZZU45couHEifnkHLh8J+Hq9Mh4=;
        b=M90bef6bmZoQJNM/CcQzuWsSSfYWZ5VAtg/e91K3PYmoKSw/M7lVbzDNsMZFf5RINX
         bgOwLB+JIA/nZ+QgBCdp8Gkp0wV+r/hMmePrChT2oKlqWpjFjbx9Rq/iWpRsl78p/UzO
         iqUrxIena6ZVvqyGFViv6du7lCh71gGBuQQwJJHBgyJ07Oso3OoUvUgF3EenFaf4tEi/
         dGrGDKiZNz90PeYkWT+0eYivSSs5T50p/Jp4JVU4qgfOEduX0f6NRXh9YQExK5ClHW6g
         Xwdq0BJmpsCYJeqO/eMNrDHStR/wBIxClkztY0ukf1u06/o1V9qhTGmdBGM9HCKjHI5h
         0YkQ==
X-Gm-Message-State: AOJu0YydIQYdbNyXQCe7+MqObGEmypNrnVSYPYxPnPuHZCkuePha3YgN
	567Kaf1oVmvhfn0ZXXbl91Fg1FVz//ja9XJ2dP96jY1s1q7qMBMsRGrK2Nu9yEyGvnIH9zNq8QX
	vuKQpcgZ6/acZXOpVYLi8YzzgBDkwAuZIF3Z0itRa4/k5GWyK+0Z81Jz6TQe4JmaIaMprWsU=
X-Gm-Gg: ASbGncu2xv98o6o1pN8R7O7+o8G77gwqVxE7kpG2K4VQacBme4yIn6hyBIcUufRW83B
	H2LbUiF5rpoTZVDQ7CjAQxHoGnEvaJ7xY4uBvDil4A+CxH134hqqoR4UNmsn4Q9O68bp62MdY+M
	GMRsIdnWwnpTgDm/quppoQnd9aOFZ2xblwZgdrGNFtRcfb2QXLMJyna8OPlwUPHDfNdGNluNHGw
	4n/w8Hf0+pg7VZNNsKF9nUGud6Ykrp3U/IndkLNwFmaw2eD/H9SmiOjY2Ct790xXfbBepFj3maT
	XGYxVhJRhqP39DSKRsbgevI52PxvIOglKEh8+XuQ7SOeWHI3OybQFw1mX0yLFVweOVghDrTSnA=
	=
X-Received: by 2002:aa7:8f99:0:b0:747:ae55:12e with SMTP id d2e1a72fcca58-7482d2772bdmr454395b3a.1.1749190870395;
        Thu, 05 Jun 2025 23:21:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHtkSOGGF36+8I3JQSop0peM80CbmsqjIXz7UOTD2eixlrSc5zwPuYLzyT9zQCN/pLblzESQ==
X-Received: by 2002:aa7:8f99:0:b0:747:ae55:12e with SMTP id d2e1a72fcca58-7482d2772bdmr454387b3a.1.1749190870008;
        Thu, 05 Jun 2025 23:21:10 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3823esm630845b3a.17.2025.06.05.23.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 23:21:09 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Google-Original-From: Zijun Hu <Zijun.Hu@oss.qualcomm.com>
Message-ID: <9fa3184b-991c-4dc5-a719-13de57ab44fa@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 14:21:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com
Subject: [GIT PULL] QCA: Update WCN785x btusb firmware to 2.0.0-00799-5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: saKS0z8iQ9QhG_H6BAdAF21YgC8H_cG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA1NyBTYWx0ZWRfXxLw7lyMP9x4J
 T+7LSBdBn0g0vDJzGGhpisOOoM9lEowpzBvfG4V4rKgEntarvvU/IMsXKbrwgAbk2kiulUjVCq/
 1Jd77H6sALtve3F2Oe3pWRucVk6KifUgQ1lQTzwdaeEr8YTMCkIYY5gjeA9Yx020FSPMxoxYqOj
 Gk0r3YARfgKqyTl86gpI9pXZRaZ+v0Y+HB0n/1cB/j3Foxtb7mPVGl+72phkVfMFVeDQu3cbZwd
 RNPmpK72iIucACvet3/t34SyddmxSvbampumwZ35LbGtxeaEuBpqu+LChYOQ1nlxnlNyR+youI5
 PlGp0f+Ej+PYmnEYYbEI/MUUQNGymB5hhNys3l5SKSsR9cjOQVYUEwQDP1dtpBq6CIb7kiQYAPV
 DzbbaV1kzjzQnPJUjGM/CxnWRUqyzuRWSri7ORtOvs9EzgXKE1adupSe1WO2QRlR68HXgZUl
X-Proofpoint-ORIG-GUID: saKS0z8iQ9QhG_H6BAdAF21YgC8H_cG1
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=684288d7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=APLsi4gsO-S-L1QMDfoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060057

Hi linux-firmware maintainers

Here's a pull request for QCA bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 3b75d677f898fe2aacc7b11763bbcd4732e71ce7:

  Merge branch 'intel/update-guc-gsc' into 'main' (2025-06-03 21:03:19 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw main

for you to fetch changes up to 57ed44c43b346ebba23afe1b4aac76ea1a4b8fa6:

  QCA: Update WCN785x btusb firmware to 2.0.0-00799-5 (2025-06-06 13:33:46 +0800)

----------------------------------------------------------------
Zijun Hu (1):
      QCA: Update WCN785x btusb firmware to 2.0.0-00799-5



