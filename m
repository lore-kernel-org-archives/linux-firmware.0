Return-Path: <SRS0=hoPZ=2S=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38213C87FD3
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Aug 2025 17:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12D92C4CEED; Wed,  6 Aug 2025 17:54:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C99FC4CEE7
	for <linux-firmware@kernel.org>; Wed,  6 Aug 2025 17:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C99FC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576BSvDm001729
	for <linux-firmware@kernel.org>; Wed, 6 Aug 2025 17:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QTCQdpvkxtXdMFyAFG5Oo7CB
	6NdnYSwMkIF8k7fO5oo=; b=HRO7nLzJS0KmARnhiULGedsfXLTi7rs48CLwq1Rz
	63FcGkjFFPOAFqdyLKQu51bFf1z0iqaGy6uQX2T9N5OE/AiB7bo/BLsn6AMgcER7
	ihAnICGKXsuPBC4joubjKyyKP8C9jx4tUJ1f0WALbHK0O5YdDo4yfoBvekN9BtMl
	PgwzFGKcnV60Racug0HUh1gFwDC9rRXG4RI6LELkJbmipRajpPlPniA5MKT/WFGa
	gASvIiH/wlDC85d1PZoe/EUwBv/gHmgfkmblcR65Aciyi6heuYoOcLYDXD9HYFOB
	WABrCLqZE83MLzSAfqmP938QkMlUxeJcOSYeFRxl4Ew/Jg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw33n21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 06 Aug 2025 17:54:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2400cbd4241so1161995ad.3
        for <linux-firmware@kernel.org>; Wed, 06 Aug 2025 10:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754502867; x=1755107667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTCQdpvkxtXdMFyAFG5Oo7CB6NdnYSwMkIF8k7fO5oo=;
        b=A/wyGbwzbYsTFXiclhioJ2X8Dk/GLGFWCqt6ikePKKL8pkDJBPLYs3aOLSpIayoNWH
         bmXsgc6j7CfZV5nJxlwBH5iItEknwJC0k64FSJ/DYXTp6QsbFURkRVQ8qMvWfs2fHWEO
         xSJUpxh0q69dYX2u7z2wJci7HkXpWrmzAmLG2tBDdkOMVj1sNBKF6HmnsjcMONj2aH4s
         0kZsPJkWTMzx2nC8AUBeNh6aCGNioAMDgmOvS11uVWDQZd68xw0UABbaUZeszzZ0ZL/r
         1RQcndWv6TVMQETyoRy81A2RXy2rTzcInexLJ/eIK40RaPALHnK42vyBqwlzxaKvdMdm
         F3dQ==
X-Gm-Message-State: AOJu0YwmFYu2IvHLHmuMskd+FHChiF0p8IT/nn4JE8BxgeXfMf6W2ZCN
	MVL2SkQiu/6bN8y8atHpWV9cBE34bwDegrs47MsCzR+tS4Dn+EsjN0ZzJ71vVeI/BwcHaPG6/wB
	RVJ4/B3sqUnFlwQQvCtX0YxwhLkEHNsGXATbW/TCvxt/9f/eMg76nDjJ88tOd5xvNSlBnfBCCFQ
	ucjlil8pN+qcRhfCk05IgrkmkIuPhyWxHBDwaVLw==
X-Gm-Gg: ASbGncvmgKLGibFO6aUPpadV/B1DfgNWg13f2b4SjU1Y8bJ36rE6EKcD8XVXnnxPwiT
	lz0Vlm8cjyrfVYPKNAqTODf2ZEUchf9F89jC1nlJe1ISSBLvFQtmAa4sNwSwbrIjqO4H7XhEPTL
	sdx6noG9u06wMUaBDjNsBSAd0=
X-Received: by 2002:a17:902:ccce:b0:240:96c1:e860 with SMTP id d9443c01a7336-2429f5338famr45349965ad.28.1754502867374;
        Wed, 06 Aug 2025 10:54:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeafTkZuPlWmfjnXziHFAqcNKKK659etQjo06m4ihj9CRqjvPQa9Ec5S4dH0xoKpROHJ9c0tU8evpIwV1FgYU=
X-Received: by 2002:a17:902:ccce:b0:240:96c1:e860 with SMTP id
 d9443c01a7336-2429f5338famr45349805ad.28.1754502866972; Wed, 06 Aug 2025
 10:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPiVHHhZYkO=0C3b4LLTUKFyFgYeZcek-hL4NJ3ZH3-dUQ1xjQ@mail.gmail.com>
In-Reply-To: <CAPiVHHhZYkO=0C3b4LLTUKFyFgYeZcek-hL4NJ3ZH3-dUQ1xjQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 23:24:15 +0530
X-Gm-Features: Ac12FXxMMpuKKfNB5liskX4NzHz_9Q3zc5z9nDtLpP9EgBZlsX8CESsc_T1yoRs
Message-ID: <CAO9ioeWWoRrjgRQt9uUbbjPY4QZp47ufXeSHQp6K2eB1qjqngw@mail.gmail.com>
Subject: Re: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
To: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com,
        mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX1mreWANL8vI8
 45JRT6NfLrxEYE1qmaC5f1uhFjW/CKHayVXDPyP8/BgAaMcpwOJNHevU0RYIsjfw9iogl27UD+C
 0puf2G7tTc/oIZhfnuw/HaiDZen2Mw77bZef9F/yiys+TGi0oAIcfAZeQ7BUB/Tkhog2+Bb2gjr
 zuSndIqDyOBvTSlY4lJHfMda3/8093JMJFR8Uk6MAEIpg938pHmtcD3K1yZ8ZIo9RDRPGwCyD2h
 4VFjH+dfZxV3bruflmrsk2DyXcQcA2q8Mei1vaLpXloNXM6C7g9iqIYtJgoA3Jta3IE9eXKU71Q
 JKmhkfuGV0S6Qk4wi4M5lCwUpygN4CK92D8ppMkjCdhfMgMshw+fOM1qgjVqqnSfIuihPPctL7k
 m2gBdaao
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=689396d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=uG7ZCSYFSAtYWZSwb2oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iOCENW3fYaK8Te3fvUYREm-nfDk_SNC4
X-Proofpoint-ORIG-GUID: iOCENW3fYaK8Te3fvUYREm-nfDk_SNC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On Wed, 6 Aug 2025 at 23:21, Janaki Ramaiah Thota
<janaki.thota@oss.qualcomm.com> wrote:
>
> Hi linux-firmware maintainers,
>
>  Here's a pull request for bluetooth firmware. Please let me know if
>  you have any problems.

Please also update version in the WHENCE file.

>
> The following changes since commit b6b0b15278c76bbc1b7aaf17e706734d4be28e00:
>
>   Merge branch 'amd-staging' into 'main' (2025-08-05 13:39:15 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quicjathot/bt_msl_fw_1.1.3_00091.git HEAD
>
> for you to fetch changes up to d7925ab31e9406a0416bec96d2d1e6b25aba6bc7:
>
>   qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091 (2025-08-06 20:35:08 +0530)
>
> ----------------------------------------------------------------
> Janaki Ramaiah Thota (1):
>       qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
>
> Thanks,
>  Janakiram
>


-- 
With best wishes
Dmitry
