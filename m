Return-Path: <SRS0=VOkD=C4=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1513FF8867
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Apr 2026 12:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91C09C2BCC4; Wed, 29 Apr 2026 12:23:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5486C2BCB3
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 12:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5486C2BCB3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qEXT3066928
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 12:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ve/smR25GMXmXpnnWNGEqYu9
	pVoNPQsPA+VBULI2llw=; b=p81Y1ervHhMeG+xxWdXwZzTqbxbzD+TeudizFsdG
	1LPyRLU4LdWL45ItM68XoyShbNf4rwk4+4w/gBhY3v1yWjfpNi/TzELL/PcK2DUO
	e8e11UBZb1CGZg0dPOqELMPbrx67TVr7OR9ViHWmpnC0rN+aNCY55hyGpB+kTAlN
	xP/v8rP0fobXNTTJbNGu8X3vXSQMGfVCSGHSxVsOBH0ECPxjmqwalkxrn3UfXSy6
	H24BFmPFfkilRg7o2GfLvY/mFMR4PQe9nKb6tzdWxd5TjxzEf5P9uG78mjh0r7aX
	TcOb3FSWYziP4+dzdpYl1MDnMHFyBZWuBlmtEhmS8wnx/A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxafap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 12:23:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56b67e8c2f5so15211343e0c.0
        for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 05:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777465428; x=1778070228; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve/smR25GMXmXpnnWNGEqYu9pVoNPQsPA+VBULI2llw=;
        b=IRe0HO62NEEs0unQJyBEWMt9EthCKLxuHL67iImMf4Y6hjbmW6TaJZVvCozwAxRNGj
         KNUVFUWbrEr8vA5PYAw3kQOcwGUtuyzm9zHk19FL1Poc+tffyUauMz5aAOUI0n48JiAa
         wnsltzfXzpzOfveNaSlrLCysBIGU0EmcDzbLG2gVT2FtbBvgZzCAojhzmo0KPSGAAAIb
         TTWqSnqWOwZyPN6yB8IAs/xRMIs8BDHBPjKiTAn7l2kwKaq/3pklBFQ2HVW/+BOwlCXm
         pDSphu2BT9ax1cxpsqSPB7D77tA2Lg6ZKEB3s+HAj0Txcu+I/BnsoICdxjk5CBOjiZZQ
         URig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777465428; x=1778070228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ve/smR25GMXmXpnnWNGEqYu9pVoNPQsPA+VBULI2llw=;
        b=m4dLPXyymhy2S6WP7uGj11rf1rKbd0w4sMxhpQ2TH1kBIZkexHlziJJvb+uh+qvPEh
         thKcrzG93ALDOzeCwsKc5rgDJy02rxwb0lGY2WXjdtK1U4w+q+ki+b+v1Edg5ZIeGl6K
         rQsmJ108uUNPE13DTRJdTRsRGiMr9fD9Nml97ajIDQDjiKm1fh3Dx3wO/RlGfjbbvVSq
         OXFiAEvFvMWnpTg54aiFYpFP56MBDvotHBLTi/gd4PZOqbZBEU3xzJ4HgtDJ8fbkJ2BH
         nKjCxyVPKsIvZT7tZj/NzYoybpxrC9ns4e4gr+xgdYdBvffJypLupZlr5so3KCXEYRYY
         2ehA==
X-Gm-Message-State: AOJu0YzoCXNdcqGno0GpgA8cYkegGtL/58dVWuxzRwqGK/bgzJxl8sz/
	764mQFeVwgC+ViXbuWN3z6zdBaON/T5LXSXhrFOt+H1Ws9stGhGYtM4+JsyJyssQPGrtODoQRnU
	c3O/f1EXW7KqyqctzWWcCc1EiFjb+QuIQ/nFnJxr0Qau3sAHk8QGZyJinI0m51Fc=
X-Gm-Gg: AeBDiesGjq+63Issds7N6JUdS1kL9VCiz9EH32jyxbGOi6KKMVgsFoVEqFVRB4ciQKk
	W1J0h42C9Oo2QeX+4DmF34fP+R28ED9dDjm9NmPP9Q65j0PzRNTxyaN7FZp+GAqQmWEAZ5Z9Os1
	0K5mMwubM9Xf1UM68jtOcrrdvweBhuOkkY/jwrajsjoAYN43tFHo6VwZabQx/g4U+crcpxGNtO9
	lK3seSSRDC4DNlQVxZ5nrDvoQxwUO9u+Pc8MevAkNzymXwqavABvO4krQ4iB6G7IsrXBBIfX2kK
	H/mH3WZcEYWm2rmOjR27vVpM9dMEDPG747VHj0VKQkSwq87cZO7x9z9EC0Iiu9YnxwNNTkxRd5K
	50/wZaPtg531liW+s+t3p8ft2iXjxA/m/ze4eP9zcGW/XA0bnlkSCAyacwqyXWrHi2vZzbxQ8aV
	dR6t0EIv95qlGXgceTyWWcy45URNsc07fc19gEEZKuzPNnkA==
X-Received: by 2002:a05:6122:909:b0:56d:9def:20c8 with SMTP id 71dfb90a1353d-573a5593726mr3857176e0c.6.1777465428122;
        Wed, 29 Apr 2026 05:23:48 -0700 (PDT)
X-Received: by 2002:a05:6122:909:b0:56d:9def:20c8 with SMTP id 71dfb90a1353d-573a5593726mr3857164e0c.6.1777465427585;
        Wed, 29 Apr 2026 05:23:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924f96b0fdsm4839411fa.14.2026.04.29.05.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:23:46 -0700 (PDT)
Date: Wed, 29 Apr 2026 15:23:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, yangsunyun1993@gmail.com,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH] linux-firmware:Add firmware for Lontium LT7911EXC bridge
Message-ID: <qrnl2kzbga2zzeaya7u43u5hwiwhizpygnr47fqgdmkf3vigga@ziyyzlp6dddl>
References: <20260429033102.3403476-1-syyang@lontium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429033102.3403476-1-syyang@lontium.com>
X-Proofpoint-GUID: auslsg7lBv6TINmqOS2KW6MlhPbjwZAL
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1f854 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=Kz8-B0t5AAAA:8 a=Mfa9yQ5v488YL-DroOkA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyNSBTYWx0ZWRfX66N26fH/Qrfw
 uUnorXZzRh0tSPQ6M/FFOQUDIPCiV6GtnnKq/1xOzt+s/Xfj2nXlK58qguvUxxXQWjDuxscoRu6
 SFK/1C/ZIX6OLu9teoojyUOGjscB8+GYTUqS7BFTXasOSU0/ChnzRifmAldK4XOSCY72Hf29dLD
 DiltXl6xwurGi13l9PQnHyje8fwq4Eb2xJ/JtwHlIDB59NsVu5J+8nIAohmmyFRZciVkMc1hD2x
 4v6xgg28pRkmSvk10XH+q8FeRxarh5LKiZUmEolPJAd3XflLo2aIPb0Nx3dNBOCMTu47EVGp/30
 +nkQq3+1MU+WZSLdqWOiQb02o9FkIke/ZjvhitDRETnsABZVX8byTXSL1j/Q6CS8sRRtANMzltn
 OkHGfrlx21c9EuYwNqYUUfATgPqmWe2Rwjeb/d+LTLR1lAUHb2faEJEKlnuCMzBAgI/bUk5HNqR
 URoeVLMEj+sjKXTihKw==
X-Proofpoint-ORIG-GUID: auslsg7lBv6TINmqOS2KW6MlhPbjwZAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290125

On Wed, Apr 29, 2026 at 11:31:02AM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> This is the firmware for the Lontium LT7911EXC,
> which implements the function of converting eDP to MIPI DSI.
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  Lontium/lt7911exc_fw.bin | Bin 0 -> 30735 bytes
>  WHENCE                   |   8 ++++++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 Lontium/lt7911exc_fw.bin

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1026


-- 
With best wishes
Dmitry
