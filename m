Return-Path: <SRS0=H0Lu=DZ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DA1CD4F54
	for <linux-firmware@archiver.kernel.org>; Thu, 28 May 2026 13:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 784FE1F00A3A; Thu, 28 May 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779973854;
	b=b+mF+sSPpkyTqnyFdG2SexTkyBr1Ii1GaC2FAHE5v11K+sABH8t6WuBLtmRaKoxg6I6w
	 fNTVz7TWqbZoFEXXFmuOXBD95lrCF5V+eggN2UPVLL3E4hw1lkIbj7pr/6UTsBbW8m7QI
	 cj/fTnNLC1sXdoNYBMxg4BradH63sO6tEzExh3EEg0oWYUbK6UnyBSZAwyN7teqKWzkAQ
	 x+JwXbCo+TFUDcA1xtbV+L+BEeAdrtZWzJYUbB3oYiaakzLStc8b67gpoqFJP070bFBDP
	 7vKqzojs1BPZpwgCNCgCH4T3QOhLtH7fH/sVJBzxxCXOvmZ+Ek+/zwb96JhMTS5AJKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779973854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NM8P0sMhvKS4N9ftx+h06UUflX6K7CPZmOKI4bkJsXo=;
	b=a5Ybr6C5bw4kGEajOHMQli54rQbgfAIcUQX4RKFKRZ8eHQuhqB6S6lnYU4BIaLsR9ivJ
	 yPk8a6Nrr4bLuiyel+eqJN35bDnV2iLG9/AZ/rk7GAQ1bn6no2NsYLbAN51YrspxHaxwW
	 dYarpqYSMsyHdFE1boDakV7/Rr4YaEMPX3VEN7nvUHy/+5Z6rI3AV9zthjqqPEpV0Bfwj
	 eVT61msCyLVG8kLXLbSCLb+y8MG8DYVpsai+r8gvO3t61mDRGsDhabBmbe9dTW6Nor5HG
	 JsWdg/6E62w7/MJL9/yKHAVjrbDfWb3SvaLJqLQomt4mJQdpohej/d3+GbRqmJjU8Xg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpxY84ib;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R+wKS1YV;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFBD61F000E9
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 13:10:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpxY84ib;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R+wKS1YV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DFBD61F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vbr5566549
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 13:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NM8P0sMhvKS4N9ftx+h06UUf
	lX6K7CPZmOKI4bkJsXo=; b=NpxY84ib9Wh4apdrKu1ZA+iFUQdYkm9UDhFNcb8h
	c73zmPEaW8QFFkenPi9B1gdH4qOY2/+coHBc6epLmh09YreMxpwjrMFO+Ki27OPv
	ycfO/pzp5iamOaLA/a9gCT1Q9v2gyl/G8Z1AV/cZ+prWAIxsW0I89Nhy/dbSXyFc
	kZrcZ0ShsJAu5um0msz0CTzJMJLE6k6EHy3rPhT49mJgqln6qWjkbSIyDeFUI1EK
	0haTXJhSQwJKmFPdBOPrIQ/QMZ0R1OGitQlBC5qAtk7W+TcU4nn9Hfw7RY58JkeE
	B6q3XJtwLBX0wkTCiLiIg+o7hXX31ES5ISuu+DkyaRw83g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjt2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 13:10:53 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5752402f5e1so26917348e0c.1
        for <linux-firmware@kernel.org>; Thu, 28 May 2026 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779973852; x=1780578652; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NM8P0sMhvKS4N9ftx+h06UUflX6K7CPZmOKI4bkJsXo=;
        b=R+wKS1YVYH170wTjq5E1qIlEohAKL+Ykna/QECtOHgxSdrZdxdLFsKaQWxZ/dGHN58
         lPKPOc54y8Kg3lTcB4oPpmuoo6fbzLW8Q07k3aFQ7C3lHeYuud/SS6uWLFJDilGF9gLb
         BgtGZDBUtbiwhhRSnMjfdC1rqj83dkLlmoHiDQuOXyk75ttYgW4LjK1qF2bCz3RFD656
         jTbVus03FIJ33Z/sWIDwgGwF9pILcLBHyWy2DrgxcUWqMvB0NXVEZxulaFZ5ryUUyR1v
         06btWajesKyCJ8dv4JlwtwKx6Nj2HIthD2asuHArDZTFj+CCWNAXWaB9SA5fs0cis9+K
         ryog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973852; x=1780578652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NM8P0sMhvKS4N9ftx+h06UUflX6K7CPZmOKI4bkJsXo=;
        b=MLB6KlAhS4k/t5d30SVX0U6AU3M141jsC75k+H2v/Fhzq9iPWDjYrbSngMhFJiLyHV
         fKnZI8wfHFXGFfWzJ02rQBfc/qozZlZIBlIIk3cHAKRll+Lk24hUd8+CwaTeZVhqfW6E
         1sD460YJoa1BhsDGWvkXZY0fhWfSuLtHW8w9oVNOZ9nLLF7J71bugt3WCU1p43jU26Uc
         Jibm7MSZV4aAp0lP6qeniPcrQP4UKiWG8jxbiMV1ZT35rRzVxKjERySOFvQR0aJrSTD5
         V4I3AIfz47VOrieK+Loeb+xriJhXXnJJJlwz8MBdhjLeguiIHW6H5Nboraj43wBXuAUj
         tAJA==
X-Gm-Message-State: AOJu0Yw+QuZwFLGmft5xTlI3oSwQNa47lb5WjRaa26ux4a1kEsKROjXn
	N1Kv16pqBnlVVvZj9Hn1jj6MMqjmBHa9mD5AsgtU5D79wCduWUbv4VjmSv0ZO+JPB1AFouNoTll
	orIZJ+duByrSw7Vdbzad6ClGax3d9Z4cK5OVxfyNsRyBn61zwUnihXBRMKaGhjT4=
X-Gm-Gg: Acq92OGp3+DbDcxSt3oQNcWQZjZX3rMGbC5X0FBTevULOI5NTXZvg4I8z1QhVygS5Nm
	URk90YuAc7901+Zm9Xs75VCcL2GZd4VRHg/3dQuzf3OzBZmsyFQgc1kUFEYWRLbXZJkzV72ZvjR
	V3xYIiJfQvpGuFmJ1RAug37lI/11aX12DyM/j2PA+6Aq72IXWUinGNAVMb/EEFqmJQdgLDihOH/
	IcspBdPXY0Lfxs9hHBm/BmS2pS9ePoL2XC+p2SCg6PELR1s5L3i+jMJQNORHvn9Pshr/T0eOVyp
	gATFAUiCmJnyNw8sE/63sKvTeK3VPBm/qLqNbO2S1V3A+VSDDEhF2rYNW+ab89rZGeb6xkAi/Ho
	MJ62PisyOY4l4Jijk3RKOPrn7BH3QzSG7h/RZTZNP/K7sZG3JUHNqYxkJkRKGbI7cGGYR3dIxoM
	Mr/Q+vs03XvYlKMMw6q+M7rwavYR2DIBkGwKLc9B9b/JCqNA==
X-Received: by 2002:a05:6122:d19:b0:56f:a329:6859 with SMTP id 71dfb90a1353d-586606b9fddmr16261659e0c.7.1779973852209;
        Thu, 28 May 2026 06:10:52 -0700 (PDT)
X-Received: by 2002:a05:6122:d19:b0:56f:a329:6859 with SMTP id 71dfb90a1353d-586606b9fddmr16261611e0c.7.1779973851851;
        Thu, 28 May 2026 06:10:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4632282dsm1928512e87.41.2026.05.28.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:10:50 -0700 (PDT)
Date: Thu, 28 May 2026 16:10:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: javen <javen_xu@realsil.com.cn>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hkallweit1@gmail.com, nic_swsd@realtek.com
Subject: Re: [PATCH v1] rtl_nic: add firmware rtl8261c.bin for RTL8261c
Message-ID: <drsg44iljev3x2iwh57s7toebebvfttofygoikhasxzz2hme6v@i6tqxusls6uj>
References: <20260528074706.1025-1-javen_xu@realsil.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528074706.1025-1-javen_xu@realsil.com.cn>
X-Proofpoint-GUID: KPyMCqqJxmZT1oxxbuK4CJ5seST-gzXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzMyBTYWx0ZWRfX2qgQgjJ3329a
 t3a7TxEoHQjwD5doghxk6o3TDWYO/O2NhbCuSj4J6RY6hAzScG2enELKQdQwYtIXnoieKiL2F7O
 ronVJoNX/kN9KKX/43dWmKb7HcH/e8kfuKRHgoz3Uel9C5xs8iZ+GByrhk3RYxWqMJc0CI157rH
 X+YwhPeP4kS6MbwStZlPSiskeqf0mKIlku3osn4g44bgDJyZM5iimTbdSKT23ezbdD5iRJk6bkQ
 y5L6g3ZqfyjLdLsDfwKqzWV0ByCLVc1ymP1yx6Vrke4FrvC9nfwBk3QLtf8PEzIAjzddOacOm5l
 5kcqx1IoEzFxiJBy0YaX5d3SxcFYNqdtpQ7rJJzkR/iRviaWGuwsPcHLQIOBOJjsFZwTwI+0zoI
 TJosl489+ueX/LA8yRFlYfYFznHG3kobZyc9fI+idlF2nrCGZUADmSIta7JvZxv8lELAq4z6+b2
 gjsNRGNkn9roantQDoA==
X-Proofpoint-ORIG-GUID: KPyMCqqJxmZT1oxxbuK4CJ5seST-gzXN
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a183edd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=YYF7fsvRAAAA:8 a=RADb_IPjnY-6mhbZwtoA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=A1P4WKtVarNJ2X4oDzNE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280133

On Thu, May 28, 2026 at 03:47:06PM +0800, javen wrote:
> From: Javen Xu <javen_xu@realsil.com.cn>
> 
> Add firmware for RTL8261c in phy driver.
> 
> Signed-off-by: Javen Xu <javen_xu@realsil.com.cn>

Thanks, merged and pused out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1066

> ---
>  WHENCE               |   3 +++
>  rtl_nic/rtl8261c.bin | Bin 0 -> 56588 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 rtl_nic/rtl8261c.bin
> 

-- 
With best wishes
Dmitry
