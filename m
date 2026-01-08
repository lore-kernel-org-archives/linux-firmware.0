Return-Path: <SRS0=UU7q=7N=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC585D185F1
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Jan 2026 13:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB0D8C116C6; Thu,  8 Jan 2026 13:33:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E83DBC16AAE
	for <linux-firmware@kernel.org>; Thu,  8 Jan 2026 13:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E83DBC16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088sbIC877405
	for <linux-firmware@kernel.org>; Thu, 8 Jan 2026 13:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HcIISBP1b6cEtGMiwBv0Pa6M
	x4H0sGl4XAIy0JgephY=; b=mhQIfvt/AolCHOumQ8dBf24bbD8wjs8VDvn61bpv
	BqT597jVo/4N0Vu7pd/jGOByFxddjCfyfl15UWV09sp1zJD3B9T/ap4gNELwV+Ul
	pxNyeKmm6pGGWDTJ95d9t1bRN8GKhcD8L/x0d1U7Rq3OEo0nWP/4ZotvjXEVOPgb
	gVDALYgTkygIVuY2dP4iThSy8cGKz8rnAJuqT5KPQWSJTVDv0J50jyRwlso2x7ti
	oQxn2C/Vh2tmbXb1TqfqFIQ/00Q1XBxTHS2Y4AkZ7kh6Ztk0f/B2CUpRru39HLm7
	ADDaoroPBHuyesUeMGFDbzhc0uNC/T+cTdmfTxrH6+X/Gw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2r322kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 13:32:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2de6600c0so816668685a.1
        for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767879178; x=1768483978; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcIISBP1b6cEtGMiwBv0Pa6Mx4H0sGl4XAIy0JgephY=;
        b=Y384vJXZ8VP0THWKoYPosIp2qVRnIwQ9YwI2TW75FZIWpmhjnx9DUjSiG++KEsyMWS
         fMs8dKXFxvGCiapWJJrmlq/9ddTYc2ZqLvAiQdI1sgcDkqs67WBZAxZIFIeVRYVqLRrV
         Gjs7dCTlgWcEfWUfPx/Bmjo+FOyvyKwj1HS63K8W++SkcXjZyAr6OAhOGbrFyk5U9DFL
         wSLS/UNEu5BENYThe+FAtBiTyMNf4RyR8GFhTObIc2pkxIJVokiY7PC8FQT1VR0IVoc3
         YPw+LtL4pgB6zm9YKeUpz0ZcbBXOgXl6T8jJESgXcI9hW3kWEUxKeFTE/386wnGouyX7
         iuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879178; x=1768483978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcIISBP1b6cEtGMiwBv0Pa6Mx4H0sGl4XAIy0JgephY=;
        b=SYdqiseWWeL29AW86gAy9Ajz4By8Vr7+jBvoox6BzfkgPHcmpc9J8jFjYFlJpu6s4H
         X79mFndVNncsJlpT5dxPQNLV3sXT8OLaJleeG3gcXkWA3C/0JH1/m81GCWQ8pNb3AqTB
         3ZztjluUajsdXbQZOt5p7x8FC4LjfTybubWDPqS2LI8Cd6VpAEQADLzuZRWz52K8N5Ox
         wrnvErn+DByEY+bjpGW8tD527CLccQiKso9r2JJdHryIRKRvfgUmuzFIL+pEYyN0SfIj
         tmNoAcMmnCY9h0Ke4C+KxiH9N6CnPXdbY3TUo+UQ90W62iicgViGzhunKT6DgIXxja+R
         l6MA==
X-Forwarded-Encrypted: i=1; AJvYcCX2J4JjAywWYQ7xoO2kWt2KXfBb+pz82EegqtrA9pOBeHvRAkfbH4oTHccusV92yqOAe0TeC+3eFTDABF+gag==@kernel.org
X-Gm-Message-State: AOJu0YyHMzQ3ujl8H1OC15bQtEqbWL/a2aC3M55FD84i+yEYsfrJ5arZ
	yHzEtfVnDIxQNO6o5JEQQqeG13LdBtnpFZK+h6+cMDw81ZHelSgXUZoloPzLSxROm8mYiWw9X4n
	zHWOH0WKQIljEZMsSq8+Nl+o7wHHiab316Kivd+giFxByFKByzT7LKceulsjnjlc=
X-Gm-Gg: AY/fxX5h41R8TBrQ1anyCGtN6XrHwrE/rMYPOiaqHIygxPA88VawycExQri5yYnOBeC
	HD7BMBUA8Uy6TDOwG5dB37pREQcxlH9uCVvklmDqemacvuIrSI2QF4HMe7ZiK5bzkulq8XItyQe
	cafx9A4+0X9/be+yB0oZCQGJ2wNzgRpCk/4jwWu0h2eU1ZOc26y6+JmKAZJ8+a+EpsHDxB+QbDr
	nlW/ZsBDrz83amPHvYp8BuRxVP1h3lQs2fqwN/blXx515In2smr1Bc/Y+bPpW895FDJYJEBIn24
	s4g8FTpWvYATto8Ju+P5lIjipp8iGEhm4TZ+xNdO+lMtcFJsY0FuQB/EAyRXl6rdZFmR9aQ9pJR
	/yCaegeqysQdMV0rqDIQDej+8NxwEnZTPsWjouyOQTKaxXr1gsrcW7OWx3pyR1I5W4ADt1CKThD
	jVx1XsI1pXM0C9AKIftLv8qNo=
X-Received: by 2002:a05:620a:1a18:b0:8ad:32ae:b6c1 with SMTP id af79cd13be357-8c3893eccfbmr949013285a.47.1767879178137;
        Thu, 08 Jan 2026 05:32:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNq0BF8CcWxyGvWA2v3GYPI4BzBH5aF7V5Qo/ygFizqocnefYcuOnB4swoyC/eqGV/Li/c6g==
X-Received: by 2002:a05:620a:1a18:b0:8ad:32ae:b6c1 with SMTP id af79cd13be357-8c3893eccfbmr949007385a.47.1767879177639;
        Thu, 08 Jan 2026 05:32:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9c39sm17049151fa.23.2026.01.08.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 05:32:56 -0800 (PST)
Date: Thu, 8 Jan 2026 15:32:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Allan Wang <allan.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>,
        Soul Huang <Soul.Huang@mediatek.com>,
        Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
        Robin Chiu <robin.chiu@mediatek.com>, Deren Wu <deren.wu@mediatek.com>,
        Michael Lo <michael.lo@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
        Jack Kao <jack.kao@mediatek.com>, Chris Lu <chris.lu@mediatek.com>,
        Sarick Jiang <sarick.jiang@mediatek.com>,
        linux-firmware <linux-firmware@kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] linux-firmware: update firmware for MT7920 WiFi device
Message-ID: <yi4rx4ddzn7iyprkklcinnnoup7azhvircgapzahvcexb5glu3@xqcc66cmxffm>
References: <20260108074546.3643110-1-allan.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108074546.3643110-1-allan.wang@mediatek.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NiBTYWx0ZWRfXy5NiccfkxV4I
 RD3eYkVs/IUoXx4R6RFXvECt3gLPURMHeDNgZ4yRmkhfE1Kv1n/2jZw9mYLC5OR0aQ+ItdpYmEi
 eOE2rymUU+aQCFA99uTSZfso6XPOtMrBA5mZsHDCk0+LOThb2p3k7u4RULY0hdJKc8P4t0VUBxS
 Qi3hzYkl1+/WykjBqIbLqkBqLg4R8vCEe5P7xkP5sk0WJZnRuEA/E41JP33v2or5apcX53q0J9c
 YSNpACz2sqTFcBKA0RK2CjTfYfGpa4Ti7awlpyYHOiMlXCmPiyOanOdzynnsDW2jtHyY2e4KCtp
 FMy4HJBfEVkfuXnQr+m2clx5MZv/s6Ytix+tm7n9AaoYKyI3LD7tSKXLS7MKGi9P1nv2WWpU40a
 wE/+1nyFZv+nM6dstPuvqt9hpYG+/YOCVYBJ2ACFERRjczc9MuBcpND8NQDNy7EL48rBE38cU7z
 TrqWTkIrHpINXzZ1fYg==
X-Proofpoint-ORIG-GUID: V0b1heqmqiAeXuLR9iqyfdNuKnIsSzCl
X-Proofpoint-GUID: V0b1heqmqiAeXuLR9iqyfdNuKnIsSzCl
X-Authority-Analysis: v=2.4 cv=S4nUAYsP c=1 sm=1 tr=0 ts=695fb20a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=mpaa-ttXAAAA:8 a=5dgp0IrvZBRSxfCoof4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080096

On Thu, Jan 08, 2026 at 03:45:46PM +0800, Allan Wang wrote:
> Update binary firmware for MT7920 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin
> Version: 20260105151012a
> File: mediatek/WIFI_RAM_CODE_MT7961_1a.bin
> Version: 20260105151805
> 
> Signed-off-by: Allan Wang <allan.wang@mediatek.com>
> ---
>  WHENCE                                      |   4 ++--
>  mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin | Bin 100384 -> 100384 bytes
>  mediatek/WIFI_RAM_CODE_MT7961_1a.bin        | Bin 802680 -> 802744 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 

Merged and pushed out, thank you!
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/847

-- 
With best wishes
Dmitry
