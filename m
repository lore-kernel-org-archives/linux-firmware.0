Return-Path: <SRS0=L+Kk=6E=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89CFD116F3
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BBF6CC4CEFB; Fri, 28 Nov 2025 14:14:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B62BAC4CEF1
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 14:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B62BAC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PVta3797264
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 14:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y24Zn6d4e/cVDCl4/KtXLCFtGEY0xduzltT6YKjAcho=; b=hTlrWgZYOzD1r2FM
	u6yPVIoIMNPnX6AveIh9Y7JMdxooVdZg0LH34/3Gs74H63H/rOdAOGYhkZizTXXU
	X9FrJwFOn5t7x/JG/XDgVKd6iqlhmbRwDEfDJ7voT9fnbn+Oe49hy4jtBLTw1Su8
	e3lCz5SIkMpH6svEMl2I+AWBqDdA6yj9r5/5eGx1QDFnSCz28/flrV+/9leSzD4M
	HnQQ7HzEDJ2K9YZ1442hFJh/g2AMtwbFDBRVnmnKUkfaMurKx/JSISJh7h9LhdpI
	1aQrDCkFICDPN91BnRteF+v0c1S7q5U+o3vr9CoiH8iTSMsuKy/I1lf2ZZ2uqNvB
	e6BgjQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnudbcfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 14:14:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9371caa88ceso720523241.1
        for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 06:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764339264; x=1764944064; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y24Zn6d4e/cVDCl4/KtXLCFtGEY0xduzltT6YKjAcho=;
        b=RR/5NvQ9OYubJjawWEzwAumunR+VPkgHJ45RZGVqkZuGx13AkruMCeE7RL+3C+uYu6
         gywQMxYADzJpVGodyzlW/d46APwqgK2Z5r1WLOxbQgRLQkMD0G3MU3xLD2UrXKhnGmcc
         p8wMvinbUnm0oEm0Y1GUpxZO60jt8luUjlJ2i5X008do0Abe+czA2ZhbSZmfCsIpXDHe
         ekY2IYHDLGxAUmAMymXdA8l2hT5tKpWIKowVxtJG9TWGkTpsob+CcXqirahjJccOVZAz
         Hd/sSEMP1RPl0cn8NOcFevbWkUiMoHOVViWTOYmXNo53OIsNt4xiQjXFreBQzYD/P2uY
         Wdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339264; x=1764944064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y24Zn6d4e/cVDCl4/KtXLCFtGEY0xduzltT6YKjAcho=;
        b=ZhmiAguyO85QZdKWN4lc+dantQDMjRLemqu2SZ09QCfGr/NrvZ2cJ2K2zVTCBzGwzP
         mD8C6bkAArZt2gUZHso81SeO0gYsg2shP74nzxvPj9/026E7GIIcLVArOE863eRYMVXJ
         7Z6MkzbS2JHfk6x1pu+Yk3/NCMe2onxg9R2zWSbfbz9EwgcxBuXuCQNI0TGnLCTq2Q8y
         WN/n9pSJ289s8ElL/YzK5X2NIEH3kcXKrw+HWM6fviW/c15qPO5k6HPZJGCKZKjGHbAE
         fEu6KRAeH95mAjzXKRppLdOxZWo7UekRrcX6HmhnhSeg1xXfoFoEp2p5nVGEZFqJJWoD
         ApWg==
X-Gm-Message-State: AOJu0YwPj+dGQkB1paqQ+S5gPo9dlTGHjf3l1aVQO2hvZGt9ZPMTAs5C
	LKTBxnjY5g26Q0pTYBjWrBN6HeS7eR3L3JCfRBk3i5PUpax2Sm5koOVK7KGq1F9mrTXH6dXUqby
	JaRcL8hE55HjGaYNTq/3AtFM2EJYXtU1Aze+vr9OGMjDNZAS6pB0pK35s8yYJUVQ=
X-Gm-Gg: ASbGncvmGeO1Abbagj5PTNBoCm+hEdzBhhohMztmhpFhPXpF6JyK2FH0ZncCvO2la54
	33uMRie/Dxn48KPmjNDThwYbQAUr4Vzz57f8umzE2k2rVZHVQwNMBRS8lkc4+Zpa1gHlVvdj8AM
	f3pmwGlO9MnZHq/UWucf9qQZ6nKnVDjGjcPxOM3ctP1/Yv6p8E7yNNQ7YtPdJZbPFgakAMCMxjk
	XFCq+mCwb17WU2RRdRQnzg6TBQcrYI78Jd3u1Lj44+5RJp9ScrI/RP8hk9LaM65RKIQFZATLMI2
	4j+AQgtrQYs2meoPTfOOb2aRdjiR51OhyYVe7ejZH9g/kMVZBZzXTklTfZ939O868LPUjtHciPM
	kKUTDtM5w2JaWaw4CUCZYBztNYXXMKRyjp5Sw5mAI21TGr80aekuJK0dR6qH/DQX/mLE/4BegLa
	gTiY4FIi5hbSYI4ul+xdGVhoQ=
X-Received: by 2002:a05:6122:1d10:b0:55b:745e:21d4 with SMTP id 71dfb90a1353d-55b8efd9af6mr7566363e0c.13.1764339263706;
        Fri, 28 Nov 2025 06:14:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUt2e/eHlHp8QKEWhDu1sAVG29ONzTq2aAYMgamYaZd5pmcXxiJ/+/CkoKB9vEst8qEUDyhQ==
X-Received: by 2002:a05:6122:1d10:b0:55b:745e:21d4 with SMTP id 71dfb90a1353d-55b8efd9af6mr7566308e0c.13.1764339263199;
        Fri, 28 Nov 2025 06:14:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7d20sm1230090e87.8.2025.11.28.06.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 06:14:22 -0800 (PST)
Date: Fri, 28 Nov 2025 16:14:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yushan Li <yushan.li@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: update ADSP firmware for x1e80100 platform, change the
 license
Message-ID: <7v2kppjyyvbub4qylprl6rlqnfltogx7ycijvebp7gf2svy3s5@tbni27b2qpth>
References: <aeb95be6-2e42-4f0c-a34d-a6453790819b@oss.qualcomm.com>
 <a4pblzvdt6xngwfp7irvaap4bebdm2rt3dgm4dq5l3dexaw6tn@os6ymb3ytmub>
 <991d4fa5-e608-450d-94e9-cc7618f53c25@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <991d4fa5-e608-450d-94e9-cc7618f53c25@oss.qualcomm.com>
X-Proofpoint-GUID: 55Km23Ovw_Y5PAyoqaLuF4ek8ugBnqcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDEwNCBTYWx0ZWRfX9B9B5MWhXCL6
 hwVZSjZZyz+nesQ98CidGFZe/3WwE5MLSrD/NWkSpiUz1wUrt8P0NqV8L3/rhEM7LzQPtqYUaIi
 n6226Wo2bhM4FvhsxCdJt2B7+NXh6i4KoGob9Urud+44z5CWfEebNVKScAji556POingf+uqN/o
 dUwTn+ch14da4+Gfbl+18596DUjmzRQO4o7qlir+fJgAEwTsBRtaCVRavG+2oPGH9Uj85o1vrtv
 jfEQYD3aeMDYxQKtriPFXG4zrmdBjUMzujpPBeTbuNdMKhC0eSNmxGH8zmPYV8RFRR4e968VG/A
 um6drFgVEhVTGfVr14qU4zlnKrFHSeHy5ReTS0xLe+tZPJilt3SRBdqVlJG/nvMKhg5iNLXsDf9
 5SEAM5FmlrXZxx+cRKDZxoIvJ7nP2w==
X-Proofpoint-ORIG-GUID: 55Km23Ovw_Y5PAyoqaLuF4ek8ugBnqcn
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=6929ae40 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=c0SzPvBZJ1MsE5CubWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280104

On Fri, Nov 28, 2025 at 05:56:22PM +0800, Yushan Li wrote:
> 
> On 11/28/2025 5:34 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 28, 2025 at 05:14:39PM +0800, Yushan Li wrote:
> > > The following changes since commit 14d4b18b066788070c382a5ff7bfdce17ee3313e:
> > > 
> > >    Merge branch 'robot/pr-0-1764146897' into 'main' (2025-11-26 09:08:47
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > x1e80100-adsp-1126
> > > 
> > > for you to fetch changes up to 818809855970fbaf8055aff5a91a133ea5feed49:
> > > 
> > >    qcom: update ADSP firmware for x1e80100 platform, change the license
> > > (2025-11-28 15:32:30 +0800)
> > Why are you putting x1e80100 between sa8775p and qcs8300?
> 
> From my understanding, we should follow alphabetical order.
> 
> However, since we have sa8775p and sm8750 here, and they’re separated by
> qcs8300,
> 
> I’m not sure which one should come next. Could you confirm if I should place
> it after sm8750?

Yes, please. If nobody cared about keeping the list sorted, just stick
it to the end of the list (or bonus points for first sorting the list,
then adding new entries).

> 
> > > ----------------------------------------------------------------
> > > Yushan Li (1):
> > >        qcom: update ADSP firmware for x1e80100 platform, change the license
> > > 
> > >   WHENCE                     |  14 +++++++-------
> > >   qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
> > >   qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
> > >   3 files changed, 7 insertions(+), 7 deletions(-)
> > > 

-- 
With best wishes
Dmitry
