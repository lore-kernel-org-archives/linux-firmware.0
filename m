Return-Path: <SRS0=Mmyi=5Z=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF24BCE8D6B
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Nov 2025 17:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82093C4CEF1; Mon, 17 Nov 2025 17:32:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DEF9C2BCB9
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 17:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DEF9C2BCB9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBFwZj2790605
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 17:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l64ODS185Ei40PvtDTtgKoCUAbdfTmPXCJH53KqiQto=; b=T6PoM+f+6Mf/p31C
	VncsHkdRIJE25byX+jeZDx5h2LYcN9F4b/1YMJ0s9Uw/GwHuOpEfyOw3y6JX415+
	hyCYGRBX94p+wfYUFJwT1VQzqBkEvPEj/+wVddf0pI7kF5/1PzHiUMvthjqdCeDM
	RrhdJZa3AH8LijJXwySLYRILikqucQhgM/ANEsz809bALxI6/epx1c889QZOunHr
	ODIjCjGVCDxinMPDYQhnfz4JbLFdYGN/9cXASnUg4bmSmqhXdQJr2UwF8u05zSSY
	7GLF8LuHGUDjjD5YopPsQvv71MzQQ5Sep/ZNqdiAnoBQbfbDxZo5KqyZ3l6db6TF
	czzewA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bjfta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 17:32:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5595821cb52so11171068e0c.1
        for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 09:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763400734; x=1764005534; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l64ODS185Ei40PvtDTtgKoCUAbdfTmPXCJH53KqiQto=;
        b=Uw3ry5uG5xXUGK0S9aN6xOvXl4w/JlS20tnfPLetBpZ9MxRMp9Ux3uqErWTxxNg94D
         iSra8XRkLceStIleApxIOTvlPYq1n+/DqbI9mhVeSlAhC0+Y+fJF7SwtRN8/35VNQBbV
         b/4bVPS+aX4nZLxHWBVi6wCXnrJH/9bfdiMrs8g9Vn1zesti0YR2qdVSto1QoWLvS2uj
         GukLN6adUnZhydon89uJ2Le5HIMYawLuqkmVG3HKXM8javvhK+53nKamL12XZ1NV7A0+
         2eRL5JAgKl9NIE3BLOJrPmIK6RmrvqtfgUP6RHDpKlOC4DsFsi8UMqy9UpcSOCmD/LV9
         xhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400734; x=1764005534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l64ODS185Ei40PvtDTtgKoCUAbdfTmPXCJH53KqiQto=;
        b=V0p2StNx/cZPfbEcO72u6YBFdu/0VJUQbMA7UDvZVSWeyJyCLAB58e20podRgwslfq
         6K4gXMZFOU2Gby9bBfFHB2h+u4kpV/0POxINXRqyax3hRFwQCktlctw6RqfMtEysyw4h
         Gv1V6a00c0AOSJQslZ2cwL7Eq62G4TcsnxGyZz746ctD0SKV8F8Mqa/e2gsd22eQ5/kd
         Ecb9UebCIpropOa5vu3wOkKn0cQR4tfWsO/rU27759pO42HWQgUghR9MH4XhcPmw4IfD
         kxGSqZQvbwM15UMrErY4M2BEqimVHdZxBFjtixcpBwbxx3BFaHIzibd4nc8XwwILX4cz
         ITHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXcFp24uVEvjLQhNw137/pjttGygC/6M/8VGOYcgvpvV0FKXrPRyNiXNFl8V8i8AXatkT8OfU4hmL6iC/5Sg==@kernel.org
X-Gm-Message-State: AOJu0YxUpOn+aQKZXkP8Pg4qsvMg+wBJrgaJY57sPcY+DmGB4WiIDdDX
	H8zBwPxPjp9irsxEt4ZbSGoHhKN4O3hIq43pXv6Ts1+1VUmstYkmiZZegy70b6Wtr8LGejBsbb8
	nwU7LbLK9JGj4LoBXHuB8ncauuebJ5/vjqgj4pB55e6xv/DyK15KlGpilh+sMg78=
X-Gm-Gg: ASbGnctYWZpFHyBD2oT5/lt+31zMviq3M+53PW4zOdiJC/pHomkEOvWtxs6/thT4bqU
	Hp/Ris8eYRp7QlPB8Xak70muwgFGoE10MUvdOk3P3CXQqTFgSFWVopYeBKuSjIByZHbQWFhUGIM
	S6WX7H/keZo+Jkel2gBnkK+qt5ZjdYNAT05it9LqLaCSQoywmtXHNMo6EgS7HHW52GYlJY42Jzw
	r/HQQEXfgUUyT6WxgaLasGKetsGyGoZxln7pfgGqH9PPeeEz/JrCnBrDBwveDtF+cgJEi3yhE6t
	4F5UNvO7vo7ItqZ6w0mVHUNAa3KuN1stWgl9jRTzBVHGLdZMG5V58lPXOg0tZJH9KSTYbuWCzE2
	UGWB1WjZZJ74QJQtPX0h8O0nZvwadd3Ik49lAZHzD8lks4iff8ykZQ3Z8Yg6nkJkMEpoHbcEki4
	lJlGFVdflR4IA5
X-Received: by 2002:a05:6122:20a5:b0:544:7d55:78d6 with SMTP id 71dfb90a1353d-55b1bcdcf73mr4169880e0c.2.1763400733596;
        Mon, 17 Nov 2025 09:32:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWUD4lB/QEtXEV1S9toor/3h6duS8ZKuAOgKwbq2aCdSrgYawc1gVWF/TFmPhlhpVfKBf+rQ==
X-Received: by 2002:a05:6122:20a5:b0:544:7d55:78d6 with SMTP id 71dfb90a1353d-55b1bcdcf73mr4169849e0c.2.1763400733115;
        Mon, 17 Nov 2025 09:32:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b2f91sm3314490e87.25.2025.11.17.09.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:32:12 -0800 (PST)
Date: Mon, 17 Nov 2025 19:32:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Li-Yun Xiao =?utf-8?B?KOiCluemruS6kSk=?= <li-yun.xiao@fii-foxconn.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Slark Xiao <slark_xiao@163.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "mani@kernel.org" <mani@kernel.org>,
        "slark.xiao@gmail.com" <slark.xiao@gmail.com>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?= [PATCH] qcom: Add sdx35
 Foxconn vendor firmware image file
Message-ID: <hdvpusci2lsqck5t3bo54xem4ihx2532mmoshu4xdutcadkgwb@d42skewktf3w>
References: <20251113104559.19111-1-slark_xiao@163.com>
 <TYUPR03MB71371479385703D0F2F6C511F8CDA@TYUPR03MB7137.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYUPR03MB71371479385703D0F2F6C511F8CDA@TYUPR03MB7137.apcprd03.prod.outlook.com>
X-Proofpoint-GUID: RG9plt4yelmbzOG-INWLLaKhkWdCMslq
X-Proofpoint-ORIG-GUID: RG9plt4yelmbzOG-INWLLaKhkWdCMslq
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b5c1e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8
 a=rIEW0nOJZNKTBh2MGHAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=P8gMff4ppgpy92pg1mm4:22 a=HhbK4dLum7pmb74im6QT:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0OSBTYWx0ZWRfXx0icizS44MYP
 49m5zjDAhqCOAc7W9FHBTw6lIjJQ/u17qQw/iBPXCSfnvGwLUuAESnCRSo+seuNOtWNOG7Yaj8j
 E+vSJcE9FNOi3XNj2Olw5orbzV3PdVr5rQUcEwc8QIYWeb8Glfuf4f5Ri5ZK/ZSy2ZhAyw4pqhE
 L+ImkEAG4LD+qRzPzUrbCnF4OvmA3A3bYK8g1vPfjcXTxX1gPOuO8++nWqRIsI3tj+F2epyfiid
 jfRZC5HtFaICsDK3+VDjWltyEd8Gdq1o0IRQhNWir3Z2LDCzvaL5nS0q8B0V+6z3B2apHnFnRmf
 iG9Ew5g5NV95BUe2SFsLhxguB5PM6Tme3SvQid4lKtvtwWHhsc+rzOQHRQ6j1aoXAlI/caf25Rp
 9QyUGsx+sl8rNf+uhq7eFZG87r8dPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170149

On Thu, Nov 13, 2025 at 11:05:37AM +0000, Li-Yun Xiao (肖禮云) wrote:
> Hi ,
> This is Foxconn side. Both slark.xiao@gmail.com and
> slark_xiao@163.com belong to me.
> This firmware belongs to Foxconn SDX35 device.

Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/782

You can now send a patch, enabling it in mhi-pci-generic.

-- 
With best wishes
Dmitry
