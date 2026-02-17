Return-Path: <SRS0=Uxd5=AV=oss.qualcomm.com=vishnu.saini@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0561AE909C1
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Feb 2026 15:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C34CEC19421; Tue, 17 Feb 2026 15:38:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E60C3C4CEF7
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 15:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E60C3C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8nsug288000
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 15:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dHWW6Ng9+Ir29gcqQbhwooT6
	5nrv4QMsU+mbD6JjXVk=; b=GVGHmmJigNEpwJOzzJSuonFT52QMxKC/6FrWw0l6
	dO+fmPMu95UaepHTJR3T5g1M0L6fqW+FAjkFIXE+BCF+LkPyfPlOqLATs0Eab7Si
	xmd1HEqK4PRp2p32TZKGIXSvv5z2mbsGjjCsYcSIOgVjRrL1Iub8XETJO2gZAQLX
	qbM3fLvgiL9ZcCRWkbZ4MwkfIPSc38QNUcPb4F1O/isSquvV0IA4VsY/NQQqR9Fg
	7p78s55XxQZm7QA62QfGAfk0mx3CikSGLPe5tEsnvrcewhO3pQctDziEIpec0JNd
	oZrGkYHmcMZGJqdzvEEKJukPhna2ux+0mj6uHivtOYrECg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrtvkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 15:38:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ad179c7fc7so14855555ad.3
        for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 07:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771342701; x=1771947501; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHWW6Ng9+Ir29gcqQbhwooT65nrv4QMsU+mbD6JjXVk=;
        b=ipDL1v/ZBkR3+UsRwmbIunxUMzQecUoeTZYLaFEPEruiRxNKRzwdzK95W1Vb+0um5n
         WgxzzMy25lewUVqNzPFisfo0CkhuE4rtGPRQ7CshunL08e1oGYl/DII4gf5DNYQO2xsg
         ne5Xa5W6+YqJRyjjttD0BLNd9ITIGVuidl7KWQ4UdnQ8vRHW/gsAvLyIn3VaC2KD41W3
         bBOCqEZ2+RjHPWv+wIpXez6dxoGYxXqJx3b3W4cLcn+9GGzgpCVMEMx5Db5pbEyOi1rg
         UHmg/NcZsI/nUMN5W21/Q+6bmcJ5S2ONNcoJKD7kDhHBv5tuF4/vfpk7zYkmssnFD30E
         MFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342701; x=1771947501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHWW6Ng9+Ir29gcqQbhwooT65nrv4QMsU+mbD6JjXVk=;
        b=KuL1MXOVKohNEU8z8x916fo0yMXaV4dy+HWaLhY7VXg8wbvOSOsGWZd+oXcvjusD5z
         lqUYJgcf2k1bf7uFmP5niOUNulz0a+ujBktMHHnoiYN3YQ2uVFQkmSTtVvbudorLEUH0
         lFC7niEAj2H/AxV5DU+ycLHMrR7KNghdk2uZeU7bWNOSSOsy88nNMiCSlD96ASQEAjp6
         OjapPzwszBx1+culphesPa1ZoU3wEQ8mymgRE0jIhEeeE17I1m0DPrg1Lv2ZFNfbxpqq
         6/02yFNU9vUO8FwhUCDzXV2MGUED+4eNlqdDuzgHJq+NVQc+5HFYVXt+T7YoIepumxzH
         YpBA==
X-Gm-Message-State: AOJu0YzNijPaYZZBFIQ+8rVDao9retxHPthNkpoAsKes/fXocwbjPbq2
	w17KiouFtaT4Nc1e8mgS/vXfa8rI+Mp1/wOhwshoUnYRedWQeQ/KvWY9St9uiHuJS6R4xpBVeDd
	I9xz2r1hLN+3/rSirYYBaWCbKRlw8muFRytLLF3Bl9woQaabY/hVQt8vojF6b70I=
X-Gm-Gg: AZuq6aIrFdpHWk9nB+A3PLrzJwuMtSvSzPK//HKVzLRYwyQDmN7hAXuzG4SKax8kBQ9
	reZBiQKkTj6BD0YN1YwDfu+2Qg1CR6b8sTQ5ZY6G2iVVWNtlE0FZ5k36oB6aRjU0VI1jach0pvB
	W3SxFt4I02HQnuZiwBwaA2pNzNH4QKvB2bRo3DGkCSws4v9ovfRRttS4KOtpCakmNw1tIfVLFXn
	Wx51N65O+cQw1xUR+ny8Im6duBcAXqGSWZgt/4Ko+em4tpF4YnoUrKVuY5EzTG4Q6rCKnsTb+p0
	RAuVMfNB4G42e4TtBecrMCxwUq2bWKPePF42VSZ8n5uxP1QKXe4tm8k8N2si6cpyalef64/a+nI
	zY+CyWCIAXgS2wpYaydb25h7AZLe6DIkK45hZVPn3y3HIiEI+czWuuEQpRWooHxxROci0Knlgoo
	EOChIl79DC5YzZ4j6qLOL4GZJjd+0BTihuMlXN57hviA==
X-Received: by 2002:a17:902:f544:b0:2aa:d320:e975 with SMTP id d9443c01a7336-2ab4caff700mr110266895ad.0.1771342701429;
        Tue, 17 Feb 2026 07:38:21 -0800 (PST)
X-Received: by 2002:a17:902:f544:b0:2aa:d320:e975 with SMTP id d9443c01a7336-2ab4caff700mr110266505ad.0.1771342700823;
        Tue, 17 Feb 2026 07:38:20 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a741e5bsm101242145ad.40.2026.02.17.07.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:38:20 -0800 (PST)
Date: Tue, 17 Feb 2026 21:08:16 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, prahlad.valluru@oss.qualcomm.com,
        Tony <syyang@lontium.com>
Subject: Re: [PATCH] linux-firmware: add firmware for Lontium LT8713SX DP hub
Message-ID: <aZSLaKRv5+IEQs3C@hu-vishsain-blr.qualcomm.com>
References: <20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com>
 <z2msqfqgx37sltehgpsmux7bcygt5essnlked7ohs3m6h272sh@t5xsitfzajbw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z2msqfqgx37sltehgpsmux7bcygt5essnlked7ohs3m6h272sh@t5xsitfzajbw>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69948b6e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=USrAEO600gjQpMy180cA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEyNiBTYWx0ZWRfX8qDfOFYWhwhx
 0ztqno9sE/jKAt/66NCs92kYPlRtY5sOOCMa1CotBlRc73UpYFjDWcEcAafyYdIa5f0WzFb8kFB
 i/IH6Yk9uzMLeju0CaljLcgjo0qxyZcHWxYQnXM/G16F0pH6PJmJ1zyZWKD9LHJ4fKsQ0t8fWbg
 SeWvn2IJkByuIMayFjs6+6Um1DI4KSudSMlXJJNRqPNzWRBVAxHv5q3rTVtNFFfeKi5VqcxQPjO
 xsAxuO+SvVBN7ZDetWJvG39zbJ7tZWe5kHr7P3LnchKNB+KuxlP5JtKldZFuV2lg1806386+Iin
 g+8Q1dyOpmzo6M563pwtvSRVTc+MdsyP9kqUugzQGLiuNL5B12+hek+5YoB1lDhrB8ErJnu5rt8
 TsnvfxURUn2QIa7t+nPyOs4b918XH0Yh03E1I1Qvefske1KOIAyOKpQXLnJKsYoKtxS+KefaOms
 ciJbMg5AwT7B3fnZzng==
X-Proofpoint-ORIG-GUID: 5znqnAWAhh9t0xuRzFBAdtw6Mpl2kdOb
X-Proofpoint-GUID: 5znqnAWAhh9t0xuRzFBAdtw6Mpl2kdOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170126

On Tue, Feb 17, 2026 at 04:57:51PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 07:35:41PM +0530, Vishnu Saini wrote:
> > Add firmware V667 provided by Lontium themselves.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Cc: Tony <syyang@lontium.com>
> > ---
> > This series adds LT8713SX firmware provided by Lontium.
> > ---
> >  WHENCE          |   8 ++++++++
> >  lt8713sx_fw.bin | Bin 0 -> 145976 bytes
> >  2 files changed, 8 insertions(+)
> 
> Also, to point it out. The driver was submitted in December, you got the
> feedback, and then you never replied to the feedback (nor reposted the
> series). What would assure reviewers that this firmware will be used by
> the driver in the Linux kernel?

Sorry for delay, i was on travel and than went on leave for a couple of weeks.
I will resume the driver series soon, will be actively working on this now.

> -- 
> With best wishes
> Dmitry
