Return-Path: <SRS0=5Ed8=B6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5151910D14B4
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Mar 2026 13:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F9A6C2BCB1; Mon, 30 Mar 2026 13:35:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BAD3C2BCB0
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 13:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BAD3C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAkYQZ2137081
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 13:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F3jfdhiNFt+AvlSRsbkEPQOb
	E8WwFFAqgjZm2AhQB4w=; b=alOnDQsbiQkYGFQROdimLxwXPt/ywLaefB4NVX0f
	SSFBFHYEnyx1bWq5MpnEruwfINQLLuX/uZttMWUi0kpGjZ1J9pQalzG17TCVw0qc
	9GLCASNRz5XnCyEZsPhvxtTOVhtWir/cUPusM38gCPYnCAGoX3T8XK+dbiBn3e3f
	eD0tLkREcATNdS9n/K4QMbCZxt/22xnect3DJqZgbmyzTUji2euhbkbVxOjjllsR
	ZnoKRpkKAZRpS/MXFcCkO184O/tw9rmQaFZrOa10PnsnbV7sRXKR/SqoVz4qJQjV
	w8N9J5qBTCVUA8SQb9P1b2Wr0j8j8gtjVp2/boOsDf80xA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmmhab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 13:35:16 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56cf4de9ac5so3481881e0c.1
        for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 06:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774877715; x=1775482515; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F3jfdhiNFt+AvlSRsbkEPQObE8WwFFAqgjZm2AhQB4w=;
        b=ZRE7gB4G8rhtIBcJdLxCyMDbaIjmW28rMNXIOQVLmLgrNQCGJaSQo5w55GOcZayw1M
         UV+I1nRZFeLB3O+6iQQLk32z5nClkNrmFj9NK/uH7FILp1DDlIt9lawkJ/H4U5OXT2i2
         go+UmFfEkWBeE+b7oYqDvyBCegFXtPCrYf1ssVYqqJ1Dy1+wEDamKu4S2QV4/IS5RgMa
         XLv/W/Qz9pbcFSQfjXvRj1ZBfWK1Qw+3NoTHZMAM/UlKU0/EsxwPqgf85LVgaSUVzftP
         kMgo3Rg+8hVmmpIulf0saZCWjU3vif4/EcedAznV9pV99/J4GOY0tyWRLOY6odRQMo0E
         Pb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877715; x=1775482515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3jfdhiNFt+AvlSRsbkEPQObE8WwFFAqgjZm2AhQB4w=;
        b=pjMBaZSLthWXtoFZH0tC6+tkRU2Jp/KCmE4wqTYb8TgXlVFdzHWbMd9/UDfuMnjs75
         aITQ4IqlSGaGFu2LQ2Iwvu00XXsRh3qk5Kr1sSFDtUqct3ftcY0ozH+TDhrkDHkAVSQ3
         cjlytJG3kc2dbro5Q3y0268hFFg0yeAj8NYuaFWaA2Kae5nzw5OotaFtsu/Xlk2t4D3o
         yUXPP+gMNh1wF3qsA/v6lEmXghZH6WyYlAUM3qSrpX0WIKj1dxYU0dn+n9s7qaVipYFY
         b9hZr++KcNMzfaMhVShiwtDsPV4P+v/9H7GpI8PkZnj6cnOx9oC5Dg/fTlc5aw7TyaM5
         7RXQ==
X-Gm-Message-State: AOJu0YzQScD7FLWsqJ6Q0xRYfQ9LlQ+hgDKBUoI/soY0FFZ7VDLMryIS
	ut/B9H6Y/DOZsd8XFppUbH1uRT0fWekXXyxzNJB/ttUn7VOpgnGyZ2z9ruRKknj4pMWu6REGQCY
	R+s5mbgaTYAZtkeRvsvDUMyoyRZf2/G4JsD7+BLEl3fT2z1/LGtYmjnyjFU1TqcOcIeqkoQE=
X-Gm-Gg: ATEYQzxTwBC9tLum96Ln1uSHDsrQx/2I+nkCuWE7u+AnqBV8w85emuSudVua3nmb4b7
	W8FCkOwPd/rhWk+tsd3LXgqppwjP08h5Nbt+8mCufW5gyBXfcAuiVUsNUVwRV5jyF9PMPAVt+ez
	Tirm5ZzGjxIAPVj/k2N5iZtG785gfnJsEFSOwrvNorQPXjA42bA4hRj9uqijMU7zlAlml6mrwMd
	1H4Np7Wa4VDmX9yKB9VtQxzrXLYuCVLTbYiNhQ1JtZUlukDe4M9k5x254SnMRRj/Fkm1sLEsxod
	xPbmoVeY5w61fgRCvM51XinxSNQneF2en4jfGVApXeJRtbkosuEiPkjJRI0sf2hJQhqxZgcmf2T
	9t/vae8uwDKUD/wCk3I6uEuCGUltMOcZjIJc8EJwyKNmOVU3cNGDjV8h0TPyE94epcnPJpOvIpH
	Arr/pv/Ir3q/re/0UVVgefSSZHND/Refa9nc4=
X-Received: by 2002:a05:6102:3586:b0:605:271c:b667 with SMTP id ada2fe7eead31-605271ce913mr1624614137.19.1774877715285;
        Mon, 30 Mar 2026 06:35:15 -0700 (PDT)
X-Received: by 2002:a05:6102:3586:b0:605:271c:b667 with SMTP id ada2fe7eead31-605271ce913mr1624605137.19.1774877714808;
        Mon, 30 Mar 2026 06:35:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b14603d0sm1642035e87.83.2026.03.30.06.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:35:13 -0700 (PDT)
Date: Mon, 30 Mar 2026 16:35:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] linux-firmware: add firmware for Moxa mux50u devices
Message-ID: <hiqsdgro4frdq2cln4d76p25t7xxosjjrwsfk7bers67um6p2u@3dxa2zepriho>
References: <20260324024635.349522-1-crescentcy.hsieh@moxa.com>
 <acokVReiF51Bmqug@moxa-ThinkCentre-M90t>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acokVReiF51Bmqug@moxa-ThinkCentre-M90t>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNSBTYWx0ZWRfXyLjSJHgVhks4
 8muWnk1hvCe+HyS+Q9tVuX23Bv522RxAuwyFY/b7U0Dfrp/M4UXyYJS1SL1mOi8Qi+Du3Rw+Iy/
 5xuHsw96zURNIIvh8VIAdqX+VCq3Iowv0Ud/1f9cctwNHizdlMXNSSLr90J+nSUXllqN+gMpGoL
 HyRwBitFS2LbDhf+B7O3YDkBU5PadGCZR/05jo54lOMGea2em7XBhyEBVrYIn90fBeSP6sWdUnP
 TrofRUwaoimH2D5W34tlQlJhr169Apj8hz1KUU8P5Uy1kUPR4Y78Ajp6v9ib5YxXO+0IZgUizTW
 pw+QcoMNvA8gC3yVvx5MyvUWu3hXCXrl9Pdrptf4IyM9LZw7bBhGvKCg4vCLFhKpEbMGF9BTmxn
 qGQZQiqy6ryy+bEtS7N5CviM4KNg2hx8ltpXeVS1cSf3SQbvHWjArpBbfDCH6DDyEiNPUs1JTO0
 /7tWK7f768nVnaCB1HA==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca7c14 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=dZ7Af3Q_AAAA:8 a=p0WdMEafAAAA:8 a=-TnKp0OMQms_8ey886kA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=xnyMoErWsJe9py2mg6Iw:22
X-Proofpoint-ORIG-GUID: ypW7lcozXoQ7oqYOH476A7I73LXPrpzk
X-Proofpoint-GUID: ypW7lcozXoQ7oqYOH476A7I73LXPrpzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300105

On Mon, Mar 30, 2026 at 03:20:53PM +0800, Crescent Hsieh wrote:
> Hi,
> 
> Gentle ping on this patch.
> Please let me know if I should revise anything.
> 
> Related mxuport driver series:
> https://lore.kernel.org/all/20260324035041.352190-1-crescentcy.hsieh@moxa.com/

This has been merged out few days ago. Excuse us for not sending the
notice:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/973

-- 
With best wishes
Dmitry
