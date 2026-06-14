Return-Path: <SRS0=8EF6=EK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B96CD8CA8
	for <linux-firmware@archiver.kernel.org>; Sun, 14 Jun 2026 21:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EA7C1F00A3D; Sun, 14 Jun 2026 21:03:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781471021;
	b=h7WPKkJpX3XXNU/IucIDTsQ1pej+v92OaY1TAI4xWdhpRCJwarqeFihWMgSmdCeCsD3x
	 PMcMI+RuexJDpyw0oS3ZaJA9dgxPlDhU7kOGURamdImQyTvNPWHs6G09/t5YKnPbu/CRm
	 HrIaaHjYBgi1fmwkscKKmA4K10+4GG2j0V+OmlVYe+9/He8S+SblfJvA8C4ef3VcSU2/D
	 Tvi0xH0WdSUBa1rxR27E+1cxOF5ljXUqggVaFafVmwo1nbBNEhK0jSa5/BPFwatj23l9g
	 ajdQYp7l5ImJinMv8ZYi5P6CYZgVpFvoUtQnsoZDCIFpSY/UqD/NoFRvnZ4/zc+mdYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781471021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pZw4eSTulwl2aREZEOLrbwDoqHTBUnbUhpCOR7qexc4=;
	b=AVV7agWYPIPbY5x/YoSBAjZ/ssXUvPauab5kglpCCGLKrALoCQ0nq+mt0I+e5qeq/75p
	 L8XsP03wG0MwITUUJ/3NqpSk/lRoTCeQBSmqZZo6tBftAON3u/EAOXYgrsuZktuOcQQS1
	 U2Q6ICZKqq2ArsV5VSHV/gqHtBZimf2BodWqJy7NpNGRQAAATkueL+2HA36f9LQCQiR/z
	 om7VJ1eyABhROn2dbs00AYCGYOK64rgyKWS3szwzAoAtRmRY9PXvgkQZUBw9HD9ypxyzs
	 gAhg9DQKwgITwkMK05bhL8hj6TEtkjj4f/Srqjit2ltVlxydtLpMnomg8Xe9lYlBmtA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jot9GAmR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UI6jxNGi;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD0071F000E9
	for <linux-firmware@kernel.org>; Sun, 14 Jun 2026 21:03:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jot9GAmR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UI6jxNGi
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BD0071F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65EGwQ55162229
	for <linux-firmware@kernel.org>; Sun, 14 Jun 2026 21:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pZw4eSTulwl2aREZEOLrbwDo
	qHTBUnbUhpCOR7qexc4=; b=Jot9GAmRaaM4i+Cx0M2ogxTT5UwJV+V5wHqmXJC0
	5Zf6j7oxvjgE/GIBt+UQnUTl96DH3abZZJj27UEwBDqDSH8zAPSEgKtWYgcYzhki
	CeIhG+OwhazHWNM3JfQHI3kZoWrsNbvscep2cNA71S/B5iVuxiyVpddckhCtJcYn
	0BMVlMhFiRcHE1QiyJ45XvCLXfIrwuDjvNA+NHC3ib+XiSDu3bz6Q9d6U163s5Jb
	zMnHtKDXy3G8XM/nhKb3Ai2MvHPQUKx4/KY95hkze0YS81n1qVEmSZxLoR7LuvhC
	R0gmlbQrxhYJ+9RAaeivk/AkdF+hmivEh2gdaYXbSnho/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffmh1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 14 Jun 2026 21:03:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f7c37734so611625185a.1
        for <linux-firmware@kernel.org>; Sun, 14 Jun 2026 14:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781471013; x=1782075813; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZw4eSTulwl2aREZEOLrbwDoqHTBUnbUhpCOR7qexc4=;
        b=UI6jxNGixK3jXHhjviTaHKAamP7Won5yiHoNUBOjXjLoYNioCVNTrDNZ8izRxsXiMF
         he7vdJkK5y9ENH9PC0HDIygdDlqjuAXlZnsmfK5JESY397XVYz1/zFLYH/tVmL37N+8j
         O/NO3nH2MUdc3J+u2mUPEyrYF17btLk10ScE4L/FPWH3F+VFPYoWBu7oN0G6nhdlWTyv
         8qUNuDVLI60o1uG+jW52X/eu3op69AzvCFLOqhWXWdpBfjymlk1km1v/FpJuhkCwRY3L
         Vzib8vT2oaC1uk2eBy4bcAIRgFEHkW4Ryi6O4ZDI124tRhb/ok4+Fv9Nis2FoXuBeoyc
         BxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781471013; x=1782075813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZw4eSTulwl2aREZEOLrbwDoqHTBUnbUhpCOR7qexc4=;
        b=Kg31KJTiRPil6reweqOC1rsIZFwnrveIdv3GzLbkN9TRm2/VsIEOVEx72/ZWqCgwDf
         Bc//w4HLCSlnTilQIxOeroun8NV3WygjrttfjqWLV/sibtPrG3LONEOgv8NmsbPOCcjo
         1LdtNF82FZu5vHktAHiHr2e7o5ig8oj7cDqOmEvcMVuzoFNKVZ9MS6b4RE/U7SIEA7xj
         P5fYoVot/2/czuViOJp67KcwonLpNfPcnXub9KoMfnlrYwCYq6CGoZEu8zC0P9y3oTGM
         NL3G42h8ve2cBNI1QhHMnJEeyPrKY0rpSi6xDPoMxURIoNzYeN2W9+O8JIQn3RmAoa33
         Sxmw==
X-Gm-Message-State: AOJu0YwEE7GdKZONT4lSmSCDWr/lBkBSjob4oKelkDdtaEzbmakVAJSH
	PZjU0WPk2SCeQ/gKdQGEMoclIbd/gucpZw2AsEyMYR8wP1N0VIZgWTyXiQ4tVG2gfDtFHxo5eMy
	Ch9LleLLB7TagNGjCO9STERJQTclzxLoeTv1fSgWYpD+lI1Jzg7R3TTbW5rLVTls=
X-Gm-Gg: Acq92OGFizkucAIg4fM6THBPwemgcgZnchZQlx519hBQo5phZjLb18+wIu41xeIZUqV
	eXQs/AClPBLtBa1333ydHG8TglHog9nbuPdy4p8mxoBK4tJUQnTWbvhA+oSoWv9dm/o/JmZWrSu
	GK4GToWRqA+Idcx/4wBrc0hnyD6cZCIvnehqZ8zrRGu9Rf1eYw8Xx82IfujFZxhxob7M/k4lLyp
	LZx0A+1NTwIkbTTEyxqV87aBYmWEUa6udskzpccv55JIGizpBYN7/uT1HZBzHVVJJUaDLFpeBVC
	rPTSiIxF26Lj+hKhX00U/8YPzAhc6XQq6fph2Cs+B5AuSsuiuheXJ+5Ox5+yN9FYEM6klny+Y3Z
	1IKhG/QUjr+vgeDJWl3LcKQYaLrx8wxXePE5WU/AsbomM8bhskL7lWScOdcQ5PbT7w1whEeRwog
	3otzRry+Y8aT//Cy2Y2ke9IQDtQzMbrqBRMcg=
X-Received: by 2002:a05:620a:f0c:b0:8cf:f1d9:ba20 with SMTP id af79cd13be357-9161bab5f48mr1783527785a.8.1781471013149;
        Sun, 14 Jun 2026 14:03:33 -0700 (PDT)
X-Received: by 2002:a05:620a:f0c:b0:8cf:f1d9:ba20 with SMTP id af79cd13be357-9161bab5f48mr1783524385a.8.1781471012696;
        Sun, 14 Jun 2026 14:03:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b3263sm2245192e87.69.2026.06.14.14.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:03:31 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:03:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org, max.chou@realtek.com,
        alex_lu@realsil.com.cn, kevinchen@realtek.com, kidman@realtek.com
Subject: Re: [PATCH] rtl_bt: Update RTL8852A BT USB firmware to 0x244F_91B6
Message-ID: <iz4wnm6b45oztndib62x6gro7r7qxtv6b47clo2vq7rwsi2ijk@za6rsxwy7emz>
References: <20260612065103.3267086-1-hildawu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612065103.3267086-1-hildawu@realtek.com>
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2f1726 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=n9Sqmae0AAAA:8 a=K_apT-K6LGRQeaB52vgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: RP-xcb4-yY1gaunblEf7FpzJQMVud3ah
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyMiBTYWx0ZWRfXxm8Xxlm4juHu
 MQUbTr9QcQMkQ/s+F1S1Nf2Dz5cylPaQs8AkknKJpMlkmxejka+3+cy2tyw9AIC5IudTatJy0Q+
 57uAMcRbe+VrWaHzIfwaErCu6QX0M1I=
X-Proofpoint-GUID: RP-xcb4-yY1gaunblEf7FpzJQMVud3ah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyMiBTYWx0ZWRfX/l0HvqPfMGOD
 quF62LusD8G5D3bOOWP1JGh1xJM6i9Tmbgorv7VqzaZpVH13LZKDMovBQZRhbRNlnZuSHsgr1xN
 nydoMr97H/pMnQXx9U2Yz/SSPcFSgzj6eb4ZtsgMHLMCDGT3ytM/TWwKltgpQg8zjq4Pq8WChxC
 Htl4gs+2y4/X9sddfdd518XdOJFLV8skxCVn5D/Zd8fCd+g4s/4G8bfg+DnsBM3h7msrhHpBOC+
 qdwaun4OKNnIoilPjK2C7KwlXDi+tx1NT/zE52FuRWsnrdRxpYuDMoNsFgDkkkZRN7d4W9wJeZp
 uwEYBR+rWTFsch5L8C8Bv6p+crDCCit3taEqLWBb9p0cpMucOnbpe7/Mnhpb/uHb5a2JtXVlyxT
 NRXbmfb0uDofmUDIE5o3uCmVgDs2EM8lm5wmtlUWCb/AlTJJyo6sUxBNRLJeic9h75hgHLE9s9R
 Mqd0lZux8oMNZmYxZCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_04,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140222

On Fri, Jun 12, 2026 at 02:51:03PM +0800, Hilda Wu wrote:
> This firmware patch update for Realtek RTL8852A BT USB controller.
> 
> Release Version: 0x244F_91B6
> 
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8852au_fw.bin | Bin 67188 -> 63352 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

Thanks, merged and pushed out!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1098


-- 
With best wishes
Dmitry
