Return-Path: <SRS0=hGCg=CD=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC83EE63FF5
	for <linux-firmware@archiver.kernel.org>; Sat,  4 Apr 2026 19:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEA81C19423; Sat,  4 Apr 2026 19:26:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A6EAC19421
	for <linux-firmware@kernel.org>; Sat,  4 Apr 2026 19:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A6EAC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342q3rx2198917
	for <linux-firmware@kernel.org>; Sat, 4 Apr 2026 19:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pw2151dI+6H9T31qb2UcC16Y
	7tGoRbJwZBvTNRHmcos=; b=Qi7wj0cJPgI8kjoLhRVlzKCupxw1EORXiYLsStpa
	rtUfo7RfttFJt7vMBelDSnsQeQuYUDSNAqtqRYIkSUnEN2ir6v3pCWevquwFIK/B
	iMXzLePzLRAcHnbtsdFYgYz1T3EwRR+3WeU3NrMEbsYNMqBUyqxhr+5DYJ+ly9Po
	RdasfTJHnpcqgNrvsh1Ldycy7+5DtJSOok5bo0tSH/PKkQvUzwauMbVowcSWvzwu
	9Aj+D+IUow7mOHQU51YLw5tQBzA+yOhit8nQScQLrfb1SjNHBK9qNs4E2xkL83o7
	5Qjj+9vR4Smh+c7So2RWz6NT0ZRHc83jjUlsYuCUUc0mIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u9d66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 04 Apr 2026 19:26:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d68dbb77bso5280991cf.2
        for <linux-firmware@kernel.org>; Sat, 04 Apr 2026 12:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775330767; x=1775935567; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pw2151dI+6H9T31qb2UcC16Y7tGoRbJwZBvTNRHmcos=;
        b=gXFDGbqQEpj/WOF+Nox3ImndkcrKwaIDVg24k4Qr0J5HtLUT0GSTz1ooLWDTRXyCtZ
         TH1Ehjiuvqofa1rMsoA9w7clXud22dKmLhwYopTsecUz9/XQEFvKuVHYFv5uFCQjLeJB
         ZuA8FbntjRyAhQxBSqiIt7Nux/p0UFFmPOBvCPnEBG06KMNAuH1QyfBd3TvX/VL4Wl9X
         KPrhryF9kl6HKVtr4wjvnu43MYFV8IW9k9nr7HbxOqhjD5lt75pSbnIqbNoiaARWw/MK
         uYcA6lXt4kLT/K2SW+ukkCEc4g0zCK1QgrOemZbyOqOvFtzApZyKCBjBZm87VGW4He96
         nw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775330767; x=1775935567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pw2151dI+6H9T31qb2UcC16Y7tGoRbJwZBvTNRHmcos=;
        b=Lwckq6X/G0Xugbnov6GRAC+vcHo8NwD9+2A5aRxMxGYhkK9i045a7Polg2hxSHFPg8
         DXGbXlTRHthuDJT6nVeGcGUuNLrmp88UiSLTIb1uS/CmfC/W8Rh0ea8JmOmhLK7dz9ap
         dx1hOzN0zYbWMqHGPoQRPBnRRtGKWgu1SVpoYfNxs6CXham6l2Z/pydkuOBHnYOsukdP
         PuoSzGyOjM3roscAhnabJeygsPnEtDw+kz0LmQius6HLnoKD0gEmbNy97GpElQh3DwUs
         9Co63uoPv3uANGRg1vfna480Bwztz2Es7q4QKX1d20OvKmmSpRJFQEbKhkqdZLuulCpx
         zoRw==
X-Gm-Message-State: AOJu0YzPu+haTNStFQztYSKugUVjcY4icTAGkl1qAcQhKl+YWo5oqpFg
	EcukyJRV9C+8VJmerSkIShw7sFAWUvzkw6dOPQ5a9ulPPC3sKQbj/isuoTZZzYSNZm4lAEEfou9
	NvlQSt/tQcbQaapa7BAO9B6TwO/Z1davT892jJxAxkt5j/aG56PVxthzQT1+FNhg=
X-Gm-Gg: AeBDietwMVYx7VTn7z5lynJ2lmaRHc4LyMNXMa80cl1VvWx7xL3pFcE2UOAB1n1QqUl
	NYW6wjmaM0/mQBSUFnCBOvGIcScn6J/OzfB+UBd9Fx6CortkS0m6AQAjUF7kciFkWsf0e0z4zoF
	2WRBm5xvEoFhNES2aIfh+7NSHEZh4lPqbRVlicwGMHT9K4oSLELBP9pwo2xxCVjbvzoynTGfjZF
	xxm/RxbL/axwV68hEli1fuSsaWAnsNWF2vR5BCietjqOEtz3KlDHRWzjCucg74pQG/juav9mm23
	ldpzgF4reD+51Fz9Z8TphdkQiPytJW3i5ps4p/ulufnWLyVlm30TiJljNAqHUqNrnDUlf65KqCU
	LL4KcsAYqbGGD6PnYXy5iuA+dzZvkEDzROpeHtn/AJTsTw8EZwuEbDDaV9LRi8wdk3Sv5hVI6UC
	PowlyQc6bhshseI57RlWkIzucewGgoF1yN1k0=
X-Received: by 2002:a05:622a:1e8d:b0:509:61:b22 with SMTP id d75a77b69052e-50d62d4f965mr114467891cf.57.1775330767634;
        Sat, 04 Apr 2026 12:26:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1e8d:b0:509:61:b22 with SMTP id d75a77b69052e-50d62d4f965mr114467491cf.57.1775330767140;
        Sat, 04 Apr 2026 12:26:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c9f42b6fsm1840146e87.84.2026.04.04.12.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:26:06 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:26:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] nvidia: add acr/bl symlink for booting GSP-RM on GA100
Message-ID: <bxuvtr6xcokzh7jxeoaogqxcag2gbmfbrhmxqitkbzdckjglwz@iulj3c32w7lv>
References: <20260404002248.2074815-1-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404002248.2074815-1-ttabi@nvidia.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NSBTYWx0ZWRfX7qlBTmXhDxJI
 EuxMLrDXpAoduLEvMsv/3rEiBpimWS4MXuNH4JdmgqhaLUpKknpLQJgu4gfDlB6njPAJEJjQ/CW
 pMO9ROJMZeH7+js1vOoOEz4JI69fzMCdCgmtO5wIJsP82uOhe32ncit+N+TTVPkhUpoK7j3y0Nk
 Lcd2hTh8VDViy3AiEDyJP+gB+/D9Qr6XCtMvVNYBHcZnlR5IbwhU5j3W/RKrXVqHzG2bcM2yxQg
 /1xxQR6/CmlsLTA2Njoqn/FG/XdkhSnhWtLchTje+qONHwA94wZtxXAYpO+142ULLFjmdBAcvlj
 4txqQp58L0vHqG689UumOg6+fXcOw1meIG4ZzkNnhKEubY+l1bi4XXIMUXWjgMHeqYkzGGDijfn
 hQ4h7u6cQFM2MjNhiqGegUoh+ANBmbOi4lbB7mt39wIEQckDB2Mar4XVm9aeV2cv7dfmMtoGEQ/
 RTZeB6CeDX90/A8eqCg==
X-Proofpoint-GUID: Fg_u6D-_ztRXp38gRbtUCATxVmNo4s6I
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d165d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=Ikd4Dj_1AAAA:8 a=qW282QkZvKa7Yvn4q8AA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Fg_u6D-_ztRXp38gRbtUCATxVmNo4s6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040185

On Fri, Apr 03, 2026 at 07:22:48PM -0500, Timur Tabi wrote:
> The Nvidia GA100 is a compute-only (no display hardware) Ampere GPU that
> boots like a Turing (TU10x) GPU.  Consequently, it needs the same kind of
> firmware images that Turing does.  Since Nouveau looks for all images
> in GPU-specific directories, all of the firmware files that GA100 needs
> must be reachable in the nvidia/ga100/ directory.
> 
> The ACR bootloader (acr/bl.bin, aka Generic Bootloader), is used normally
> by Nouveau to support Turing and Ampere GPUs, both with and without
> GSP-RM.  However, there is still significant code missing in Nouveau to
> support non-GSP GA100.  Consequently, the firmware files that would
> be used by Nouveau to support non-GSP GA100 are not included.
> 
> Since GA100 uses the same ACR bootloader as TU102, all that is needed is
> a symlink.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/989
-- 
With best wishes
Dmitry
