Return-Path: <SRS0=ljtV=A4=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B82F4BB6F
	for <linux-firmware@archiver.kernel.org>; Tue, 24 Feb 2026 18:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3545DC19423; Tue, 24 Feb 2026 18:33:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AAE2C116D0
	for <linux-firmware@kernel.org>; Tue, 24 Feb 2026 18:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4AAE2C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OH4BPE583442
	for <linux-firmware@kernel.org>; Tue, 24 Feb 2026 18:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IiXjp2FBeHnWoqiEPjXdYO/2PPiARq3LhGEILlcsis=; b=BgJJKzDQa/UbFknX
	ETLa9MTLQ+nSWs374tnkuZJlp+qerDdwEepaP5hI1+xDQjXW/+44Ev4vEr28P38U
	xduFjRzIkBjl+tZo/slwb4pIep8/OEyDl/PytinmESJVMBS0lBLE3h9isD+TWfYy
	jRuN90IavOXO1jhOrAT5YRuRW50vnJ+NLM3nVASsqCITn/iJtwXWT8nmfk0bXDKd
	P4Z+YThDByH+aippokfZdws8JF0MFM8Ir4tXp/7Qy3vtbdKJfXpcdWuuKxMOBCBS
	36PP5GXaFWd+Pe6V8/ICC0dcEW+A8NhCySt5geSK+OXNCEO7HAar7Qpc3cZ/JGcF
	dfC/EA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg2grbjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 24 Feb 2026 18:33:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4817f3c8so4446139685a.3
        for <linux-firmware@kernel.org>; Tue, 24 Feb 2026 10:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771958009; x=1772562809; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6IiXjp2FBeHnWoqiEPjXdYO/2PPiARq3LhGEILlcsis=;
        b=V62CUI4yWiB0SP7DfHv6l/mRGmfOraa5hDoaiThGA9uvxuw6Ol4Zyl9SsBezb0SFYP
         9GO6hSqRw9uDavvVlXOZR2FLuk8mRyDDp5bg6oS5cdMGIv1iGsGv/CXQhtaUX0vPgkor
         z3IWHxAk6Ir+fT5I77J4YQsckfEkJKGcTRikMGgOjvoUEzo1nS4ni0o9rATq4ACDRxEP
         IKdd+F+0ThjlNNqGq2dSeYfAMLQcqcTO5kiQiyUzpIdtehs/Q4vy4ynjrzCqeR2ZjNT+
         tJD3AOMAvsvPtaVliJ5vsGC7/zvqSafN4A4HzP5V0oopWjLYSekRas/B2iaaDlPckimj
         HhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958009; x=1772562809;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6IiXjp2FBeHnWoqiEPjXdYO/2PPiARq3LhGEILlcsis=;
        b=f8emMmYrvBGw4mO85OCuQHpp64D7qEexibI1jSJRsrz/Y6mET+hwlBz9N/ZZ05NwQb
         okK4ZQUmtBOlEis69VoQcB/ucByCPdje1fKUZjkEmhH/KwbfiYcZ+U4colV9+90iYCfb
         f4XHOoBNwSEoj/tQYxaCZP7xGQrC9ktS5ctU+2Y9MUm+kzPQ0cVYPMR3Rle5QiuVKpOz
         seP1TiL7aPepERK+EsU/eZEbZJeCtUwcz4KyhnF4bp/QPbSFOvxqLop/NbeAeO9UXSnY
         IjYzdhQsElh9tBV0g96uvDG9RRFXwTzm+TpcS8sqt/FUqC9yUb1XAYfF1zi+b8YKS7Dg
         7+IA==
X-Gm-Message-State: AOJu0YygOIpAVgPc8H7Zn6Tj3Sn09++80QZMElf5TPE5ukoU3N2mOYg7
	7VwDX2ENhipLcpd5l1xjgKfLfpR+hj0kZ5sVzjy9h5lH0/3DOtVZfL/uFvPpPkLMruMhz3ZiosD
	xZrJurLw5M/4KCwYGIeImmYsmaQ2/j1yJ2J7wMscrbNtQWqRArIYZd0iSBfSln08=
X-Gm-Gg: AZuq6aJ4y88SWx8/cYYPS+ht8Idg5MtH7QVugsDyAL8gcnPxcgdzDIGXtVTZ0fqjaa7
	8lzP3kzNk7BcIPayHjIEQnQ7EyXKJ161JYZ9vyFWBrNK2HNqYJR0ObAVOm+ZglOaJdsYwbMOzEg
	DU7vWiLkXt7X4gFagD4IxAP/ac8c2PS1KNdiCB5yrLH6Xo0d0SGCUc0viYUZAYSRyBwC1AWUMNx
	WiTad5u7J1Ry87JC6VbJzlBA05nDjfSRrOfLgbMRZ4TGFpkb2eEcBnVpzRR8AWw4cDToMcWaGN8
	8HoLDSjYE7B1ITofYPVCcZDcAfNhLMMi5Gy+5QY9C2zWN1BBpOezZ0EZJDBMhHDJaCVfozpzgU9
	iAtvIw3gA8F3dGkyLaeyE+FYjxikKXMoI5Ftz/Rh+T2sbmU9b3FH+bQotARJ3+q+m7wu7rWb9Zq
	Ye0hXhRZJq7Nw7fEs2/aI3zuyOIsrQ2RGrw9E=
X-Received: by 2002:a05:620a:254b:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cb8ca63f2fmr1684708285a.45.1771958009241;
        Tue, 24 Feb 2026 10:33:29 -0800 (PST)
X-Received: by 2002:a05:620a:254b:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cb8ca63f2fmr1684704685a.45.1771958008769;
        Tue, 24 Feb 2026 10:33:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb3ea3asm2392490e87.58.2026.02.24.10.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:33:28 -0800 (PST)
Date: Tue, 24 Feb 2026 20:33:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Tony <syyang@lontium.com>,
        =?utf-8?B?5pyx5pmT5piO?= <xmzhu@lontium.corp-partner.google.com>,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH v2] linux-firmware: add firmware for Lontium LT8713SX DP
 hub
Message-ID: <vfhlpudqtpwaccavyjgqhqb4grl7vxdkzdyp4xwzafvujak72d@mfeczqa5h4iy>
References: <20260224-lt8713sx_firmware-v2-1-8aa80156b88b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224-lt8713sx_firmware-v2-1-8aa80156b88b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SjIyBZD2pHCCtVkcemJGooBAOfrsXpzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE1NyBTYWx0ZWRfX0Uwm5VCYXG4d
 MBVygnk4lpZgGHh5DpbdXzJ5mocvWLIyvJOhLXIsUhLhOR8MRAVUb3rEVwWHKjCvUGt7Qzn0HED
 dg4wuszI1v4l6GSHjdQsn3PVg18yrYn+YMY1F3LH24OpqHPvyvwRhwfCGq2w2j1LM8gnCEYg66k
 mKz0oxr3MrKrioKVbFjvc+0y8WPf3WYlb6BWHciIZBwJGZ7dZPAbQq7M3k7WUsdvHtGRfyFzVKW
 06nrv6p3fIQtLW6vYg0Tg5aD/+GZCmcsvtenhohJwz2l147aVy5yykHTt1aoBwGdyUn5kkmKShw
 ohYZHb/e7B6qSFbWrSyJUWq1bapLR9r55vP0qBWVFGpHsNKtFxmxe3spD0RbC2AeG2pXgH2x5OF
 I3Fr6A+PJa2cfAD2q2kkXk+2kCcL+AWnTU5k9V1teCcqva5JSXCfmtQ0RVIUrXU3PWeCCW6NZJt
 PvYsnynWij9kLexLTVw==
X-Authority-Analysis: v=2.4 cv=ftHRpV4f c=1 sm=1 tr=0 ts=699deefa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=nQqkG6HURcealpKKxnkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: SjIyBZD2pHCCtVkcemJGooBAOfrsXpzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240157

On Tue, Feb 24, 2026 at 11:42:49PM +0530, Vishnu Saini wrote:
> Add firmware V667 provided by Lontium themselves.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Cc: 朱晓明 <xmzhu@lontium.corp-partner.google.com>
> ---
> This patch adds LT8713SX firmware provided by Lontium.
> ---
> Changes in v2:
> - Added Lontium in Cc to confirm License and binary version

It doesn't confirm anything. An email from Lontium will confirm it.

> - Link to v1: https://lore.kernel.org/r/20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com
> ---
>  WHENCE          |   8 ++++++++
>  lt8713sx_fw.bin | Bin 0 -> 145976 bytes
>  2 files changed, 8 insertions(+)

-- 
With best wishes
Dmitry
