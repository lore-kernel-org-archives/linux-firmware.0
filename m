Return-Path: <SRS0=CN5q=2L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B104C87FCB
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Jul 2025 11:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35331C4CEF5; Wed, 30 Jul 2025 11:37:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B474C4CEE7
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 11:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B474C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6GBAi006589
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 11:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2TKbhkTl7hBzNKvh372MNdwd
	OdGZwVVh7sa4q1BZ4ig=; b=kq1zWPoEV3SfKXBLvSWdu1wtRVRgBprMYEvbMSXY
	8uAnWtN232n/U0F6B3KIP7veUWY8eLKSNwPKb5koE7a+dIOO+6IGZ8Yv2O9bubzh
	zs3I0gQBI9u5u/QSG//g8MNyRN3muacLafCiCrWH70nsCsNDQM1hLWz8yUCppRQO
	20jpcTu9C6tGbTUurGaTFiOdmfq5tFYFcwywJ/bclVTR+J/ThUQ+vpUIRYuErhqg
	uGlmX9J5D9tNIjD8/qSwp54a+SaQgbVHBdAqFcaolQKajJZ6QS6OBGv5AlHHiAQA
	XHm1luVHQYuYwmvBAffRtwBzRkseQAYGfpU61T4ZI+k8sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu3wh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 11:37:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab801d931cso16835641cf.2
        for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 04:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753875452; x=1754480252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TKbhkTl7hBzNKvh372MNdwdOdGZwVVh7sa4q1BZ4ig=;
        b=sH6DbuC7ELz6k3q7UuoXcfjb6qDHgsWNQ2rUqUeIZdbCjgQxdw/HdoDG3DM4jpRzZ9
         0YYmnkp9tpvXdPeAZCGeBlWZ7WbySML2rQTWUw068MyuFQldZxvaoOVQJ4msJO0KqhDA
         Ni5NTZfcOiRVALFYgq/sNMw/x4QaT5Izgc3zIS21203YYN5pBATSmTPs25nMrgVXAWKt
         p4KMCoty+Vtyu89GTMCvn1axfPZm3t2dSV2sHSBYNrSmMZ6lrkLxbmBMXWrfQBMcDwsJ
         rBpzTJmSpY8Iw7TvEwRh+VJ5KIfam17vuf/ol+bC3VzdDnSsrBWXD0uvGIdEzKV34xil
         KUbw==
X-Gm-Message-State: AOJu0YzGXHrBZxIJdgbySXHgvMWqmUCG+NWddxuU1gEEGqSx0agAufn4
	WTAE371S3WWMn+qgSzVZpTOoAAkGidViy/1AbISaZsEjwO5ozzVVNoDSC8sshktVyyL5ITyRuBD
	8A+9WltMj2470nMh8jLnkl4Q75JS6HNH0Q1qgUbCmN+DC2FL1iRyTgJKlcsP8PJGRbNT+7Ak=
X-Gm-Gg: ASbGncuqjeori53Kt2P9sYoOv2z4DqzFGoa1XdoRceIiOwUsRlEPeKaBjt20IsqQLm/
	gnm1vwA9NTI4RUxrSWZCmvH/XvrEK8Y/gbJayKXqcT+qDMRcWcboNzPIDA+RbttbZkfa4hM1b4n
	6yQQlH1BOc0G/o2cWHuKPUaybA6SrAFariWIUlJw9r3Hu8tAc8esVUnc1ot3LqdUMDheaWwWpgp
	KeHo0Yo5A7hqpBr2tZF36R3c0Qm8cMBX428CjrsBRFhAf1+Xv+iT/yORD2Trk1Ph25smlYPQmmd
	di/FNktFz1wM8kTSIYLnFiHOjFcqlNckaZ7PladDf8BP+jZcvrfiATVphhdgXH30F5/W1lYZICk
	lP7BkxERN+5+OSX0QIvhUZp18+Zv+Bar7FL9aPb92Jku3tGEcxpqe
X-Received: by 2002:a05:6214:c62:b0:707:4a74:22f1 with SMTP id 6a1803df08f44-70766e7f299mr29719616d6.20.1753875451886;
        Wed, 30 Jul 2025 04:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHASDlrH6A3AWNUkgiZEHGg6TYW/2sZe4uItvlxZKpwJX32QEP3eAKxis0oJM1iJbi6GegKPQ==
X-Received: by 2002:a05:6214:c62:b0:707:4a74:22f1 with SMTP id 6a1803df08f44-70766e7f299mr29719346d6.20.1753875451425;
        Wed, 30 Jul 2025 04:37:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b631a1b02sm2124420e87.71.2025.07.30.04.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 04:37:29 -0700 (PDT)
Date: Wed, 30 Jul 2025 14:37:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <vkasinat@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: DSP FW Release for DSP.AT.1.0.1-00125.5-LEMANS-1
Message-ID: <ffuibn75cy6z64tfswlva3buc6dgnx3v3yj3rw3kl2nkhyxb6y@v5r53dbggtcr>
References: <IA0PR02MB9917271A219D863E771166B4EF24A@IA0PR02MB9917.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR02MB9917271A219D863E771166B4EF24A@IA0PR02MB9917.namprd02.prod.outlook.com>
X-Proofpoint-GUID: NOCWPeg8b8k-WvNjCkb11N1XQAvBVG6z
X-Proofpoint-ORIG-GUID: NOCWPeg8b8k-WvNjCkb11N1XQAvBVG6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4MiBTYWx0ZWRfX79Nvvw354Gtc
 LB6VrBMHfr7K+czzE1Ndz7Q1UIsclfoxbguLtdylGH/ZJ0jByWTnmva7WgyTsSLtaNn/UE/U9PB
 4QCFmR56P/X/zeSdO9tf3kSpxTJNxH+gsfOkkdtkFerqfpBXGCt79LMh1F5tRjFxs1SrsrCLa7W
 Q+0egwtvjwk10mF7jWRm9NXjOzkpx6VHsjlx8SEvTuGdma+3mAiRG5fJBxHou0cpihm1vfewxHY
 7f8RqgAKMmqEG3oCDBtZ8VBzOT58Pcb9obVYfv0xC/3jwHG1awPexzBqetM55EExVmoIIpS76Wf
 OWKUeDmMAKhqvaMBZS9uirk3dgSq11ew28PXMv6KuLExBDtwbIXUvq+mwPJxyLQAd2N3SMpSIDd
 IVduII+WTHT/Cc/hBJ/s2vWs0wTYgC5tDLAtfRowD7gjkVrU3sBR1Q9lGV8yNWyIjsNKXhJT
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688a03fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=aCZ2d_tGD5f-outQIg4A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=704 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300082

On Wed, Jul 30, 2025 at 05:40:19AM +0000, Venkata Kota wrote:
> The following changes since commit 04c379b552c7ff194e0840ede6a2997d7deac691:
> 
>   Merge branch 'robot/pr-0-1752559067' into 'main' (2025-07-15 21:06:17 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcs83005
> 
> for you to fetch changes up to e58faa78b6d6d88f0395bef769628d04e937dc55:
> 
>   Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1 (2025-07-16 14:00:17 +0530)

You have posted this a week ago, got a feedback, ignored it and now are
reposting exactly the same patches again.

Nacked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please get back to the previous email and respond there.

> 
> ----------------------------------------------------------------
> Ekansh Gupta (2):
>       DSP.AT.1.0.1-00125.5-LEMANS-1 DSP Firmware Release
>       Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1
> 
>  WHENCE                   |   8 +++++---
>  qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>  qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 2629632 bytes
>  qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
>  qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>  qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>  6 files changed, 56 insertions(+), 3 deletions(-)
>  create mode 100644 qcom/qcs8300/gpdspr.jsn
>  create mode 100644 qcom/qcs8300/gpdspua.jsn
> 

-- 
With best wishes
Dmitry
