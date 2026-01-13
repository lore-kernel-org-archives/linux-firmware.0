Return-Path: <SRS0=/yXG=7S=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AA4D0C84D
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Jan 2026 10:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED444C16AAE; Tue, 13 Jan 2026 10:45:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DF3AC116C6
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 10:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DF3AC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5apdG3636918
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 10:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9I4JuA+DTKrsxAvgGNBrZD4y
	gy6kYD+KaH47v1t+hV8=; b=c+6tHYd147u6Z9qI8EDeKTvgvPrWo6o2hDXsE9YK
	f3CVlzV6eSxPAc4sgRgM1FqE+EwTKvHXXuPH4byfc3LXUevwVs953j2dwooIu1XP
	cxTak+/YTgi/RX6eMaWNIcYC2Me08b7RxyhMjls9tEgEl8M71xjsjLydFGcN6BhW
	xuH/wQ+XrP/5NlA2AZASkroPaSkhb1EJiUFL2CQp7F/MoUEmlqI8XnRV/uMUUAR3
	dUvYucDqzYvBHqiQPr8Ip0SIxWdRTCG9WcDT8xb3ZRBZ2bszG6PgBhKriRxQ5lvl
	5jdwc81/0m6IJyGYI6KeMza8aVDmC+4oYepw1FGXbRKE9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c0yg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 10:45:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24383b680so2987693285a.0
        for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768301122; x=1768905922; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9I4JuA+DTKrsxAvgGNBrZD4ygy6kYD+KaH47v1t+hV8=;
        b=kB4N566y/AcTc+miadodVG3mvlT1B5ssK43Tury2D0WPIGc/OjTPQ8a5iGHxmPAFqN
         dDBx74QDQ8lsSsrGqnoEHCy5T9ScaAhvKe2VJ43uNC5zEN8n7uI/mjuBF1Vk0BAdfzUB
         YcCLPw1MTt+1t2sjK1/PK/oG1bvsfE7aJuzfS6pZlp/jirDrPwaD59pKdw3U3xaYv5TE
         MhdWPjj3HxxrfS1ZE53jGYcllCbpzjSGXL4yWSK+F5Vu/DQIdm5np92Ie9FNMuvufocJ
         6uBb4Ba0TSvFurVbBjCS37IsvRqv0YQVr22hUKWIlAnxsYLHAy/tOnH2Zb/O8YzFLIpe
         mh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301122; x=1768905922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9I4JuA+DTKrsxAvgGNBrZD4ygy6kYD+KaH47v1t+hV8=;
        b=VcYb5yxLiiDx06jTxdkB6aiGw9onNOuLKJNjf79Ts0SaN+6/c/D1JQbwONiJBYcu+Q
         0yr5syJnqLw2JqC2QP+7qQM1jYZd7yvTWGGyq0lpGE7uXAxIIVt2/PEhUdxdTeLe4cns
         MNGbPNwvymrVdugGOWUK4H2xXovbXErnPFza4mAkTtnhWjW4nBDd77n+xtZYbBcvqc6W
         63UjpXyBX2Ysjts3tjPd1wlkpBK6jcw+wg52dWveYTLGGpLTJ2gbVr/Elr53NMHrtIUe
         ZxPmf6rkoJ1abFximBcSGn6bPb0IJX5LsrfVVY/Y85T9gBgIEFqlsJtGWEHYP6W4lxRC
         eURw==
X-Gm-Message-State: AOJu0YzpA/J5poEy/CZQMUAM8aID93grXPSHSbKBfXe5O8vOniU4GyM/
	T0BG67Quh/OcHtSE0WlL0MYk2jNDNl85GpfDuBkUVXDQKCNqhH72dwcE6FUZGne4/1ZDsrhZX7l
	m0GLGWQgI8zII+gH865NMUlnoD2ZUbQjPN4s1ucF43gaP9OWufA1yXdwSwWaiInc=
X-Gm-Gg: AY/fxX5St6pqN3lHPIZUNSdRvxTuqAzUYx8cosii7jfNOxD2E67mjaotcL2ZLBUWs6e
	kzgAWienOIdN1664n6rpV9gLUp81ii579GCohmG9XqvHb4//Zsxxl7g/e/wak9Zi06yn7gt1VCB
	3WeWWF+3bgqhGewmwiuMvquqnWHS/+6IdXLmq3xrR9fVOTLtMfURB68r1E7etd3DqNMSYRXiyt/
	+QOG05bzuhNUBv9lBF5cGLFB7OMTxPS66PuG0/RKXnnOwfko2/bQ6Q4nav2Eff6Wf/tTAWRgwHS
	UcASCODEcKd3bobAhVHDaArvJskxM1IOqlb7wdGW+zgrfvy922wRK95tE+kegkl0qDBYXGjTD+z
	uzYqAwVRDKGloyFNdkkFCdzLCdYdPWFC0mmWgK0xdwOEzsA9D5d9e3dHaZaXpZLGVRtajjEi/pJ
	G9Hb8L5ux0xnj1WMmJdqmATec=
X-Received: by 2002:a05:620a:4620:b0:8b2:e8b5:1ea3 with SMTP id af79cd13be357-8c389396ee9mr3113900485a.28.1768301122169;
        Tue, 13 Jan 2026 02:45:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+v5i4OzVytG7YmTzOdtD/BVcyfWkUol5gVPPJzVXwcGpOBqn8M4DeV5yIFPElPgFt6kFirA==
X-Received: by 2002:a05:620a:4620:b0:8b2:e8b5:1ea3 with SMTP id af79cd13be357-8c389396ee9mr3113897385a.28.1768301121697;
        Tue, 13 Jan 2026 02:45:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b67b51b4csm5404992e87.19.2026.01.13.02.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:45:21 -0800 (PST)
Date: Tue, 13 Jan 2026 12:45:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
        nfraprado@collabora.com, Jason-ch.Chen@mediatek.com,
        angelogioacchino.delregno@collabora.com, Macpaul.Lin@mediatek.com
Subject: Re: rename MT8188 SCP firmware and add symlink
Message-ID: <3imlk7gitfiazewwrlottwnewfn255othxe64ui6jvusz5akjs@r2tmsrx3y3xx>
References: <20260113094541.2528905-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113094541.2528905-1-moudy.ho@mediatek.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5MSBTYWx0ZWRfX5PnKaFtdtGEf
 zG3jcNIv2TMfAdNjMNclSgKk6Z21F6EbKkIG9AQg9tWfLQ2XEd/2RFLqDnL1vEB7aUmQ/XzMMsZ
 REOCBJDXlOJPj5fBzP8HZxP15rClcB/eNy6VuJy93MbXzLnKCgdDjTBVq4egF8tn0iWnRTQ10v+
 DqAMSKSQYLEQzEBHpH9oEaAmkEt0UfUUuGJjFgS69qf2PzFOD2HMC3JuROQl+aEb91tri6sgsaJ
 GqnrNjPr9rUZwyrkkYXADBYH5SNKWk8Je3QucSCV1eZrsqhYUy9EuRf6bSSiHTekUYSCiRNPybk
 hun6wOU8djMOeYbXyX8QxPTlZLz5AY9VDPUYTO9qcCrBGXQXjg/dergfFQkQXRMwbp2F/vBcvqs
 tt0v104iFA9BGaAETwDS9em4ZcqI9QYy3sFtxywNGZo5jR9JsQ7s/BjNYp4Y7D6Uimsrl94tUru
 bkzetCKglhJ5ZNRf60w==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69662243 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=QJzb6Ko3GgTxAw7dr1QA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 5mdqU_p6ufpVzY4ISl0eV6hbUAFWC9AR
X-Proofpoint-ORIG-GUID: 5mdqU_p6ufpVzY4ISl0eV6hbUAFWC9AR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130091

On Tue, Jan 13, 2026 at 05:45:04PM +0800, Moudy Ho wrote:
> The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:
> 
>   Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/MoudyHo/linux_fw_scp v27748.03
> 
> for you to fetch changes up to fdae06e63ed75fa3a91c8fab7a88c7b22c12ec3f:
> 
>   mediatek: rename MT8188 SCP firmware and add symlink (2026-01-13 17:13:26 +0800)
> 
> ----------------------------------------------------------------
> Moudy Ho (1):
>       mediatek: rename MT8188 SCP firmware and add symlink
> 
>  WHENCE                     |   3 ++-
>  mediatek/mt8188/scp.img    | Bin 636548 -> 10 bytes

If you have Link: in WHENCE, you don't need this file.

>  mediatek/mt8188/scp_c0.img | Bin 0 -> 636548 bytes
>  3 files changed, 2 insertions(+), 1 deletion(-)
>  mode change 100644 => 120000 mediatek/mt8188/scp.img
>  create mode 100644 mediatek/mt8188/scp_c0.img
> 

-- 
With best wishes
Dmitry
