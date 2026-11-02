Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515F606A5AA
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Nov 2026 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iTfiQ1JZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cC9Q9PlZ
Received: by smtp.kernel.org (Postfix)
	id 2FC501F00A17; Mon,  2 Nov 2026 17:58:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793642311;
	b=3kzjol597fuXH92h9y4tTh1CePWgtx/W4hCdrNLaRYlguAEwXyttjU3vkoAHvxr6XSqA
	 g7IotM551/b0kCDigZ2/X3sMH9rwFfGvKvEb06opDRbc6QvwqbDsK5fwGr6SJau+e9Jvg
	 gV95Fb30vaDU09yK2jmtWLR7/3qB7wWGD/SGwjChNCI2DMXHeHuq0ObT30E5XBFSGqGuW
	 E4x6NjEuIDzk2OTYcmf5jvOEU0lIt4716A7w4f7RdyA9/J75l+SZB6crgkzZ5YC2IVRuB
	 5i9SJgORwGA35N9bVhwgXIY5qRHFurF6dbnRR2mBwg7Ncw/74KEcgv/+8TfZ8dzoiZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793642311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AcWvixxNenFNl/1u1V+5F/SlABXITyIvPxEuOSDu+tw=;
	b=DFkjH3LUJuWBZ6W4RrwLWntnrb7vDVyEgePzGjZFZzJMGYXsgRf3+FosiurXpVC4/J0H
	 0ZXToKL/dV6ehH/MYQi0YRmZhKIAeUM8yXP/q4OHkvhlbM9QI5SnZyzMz1JEEFjWEWfx8
	 Y1NhNHxAve46Ttew9EYAj6FPGliuAwuIdp+nwdBqfT2Jryo9FX3gvgIHm3e0vNMci5Sjp
	 nCn4qLn4dKptqH0O70e6l8HolxoShq8BpUIddgcSu+CC6pmMHW14cY7lQB86zZifMo+Kl
	 z6nXRKjdMGdgq0tfjFasLCv2HC8QAADMKm/ZVZ1VM64RdGDRaA5XHsMyyPvsjcJM7dQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iTfiQ1JZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cC9Q9PlZ;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8808C1F00A16
	for <linux-firmware@kernel.org>; Mon,  2 Nov 2026 17:58:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iTfiQ1JZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cC9Q9PlZ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8808C1F00A16
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HP2Vq2932479
	for <linux-firmware@kernel.org>; Mon, 2 Nov 2026 17:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AcWvixxNenFNl/1u1V+5F/Sl
	ABXITyIvPxEuOSDu+tw=; b=iTfiQ1JZ5mRNI3fT6pKEhRdnHE8ptHq5MTb4dJB9
	xl63+CO1Xr6dDJRXmrQJ82o3caFHrqqbvOcQzQcACf1ZvTJA944drbmTsFYIQfBu
	m3s3Y/kdSqEZ33KblYPsgKZJJGF7ruBJbUzxh+av4t1g+UaI/aSN/fI7QwFdXdr+
	Z59QhtXC1m8aB8t/jZiAaA+PuRIxz6HoaBZela2RSc22ge6fFxHQ/CxnOVyincen
	KyyxEGWUzuzwuFghPdUKPVqLA4UJLeP5+zGsuhKNs7cbJ6q8qPs7ZH6l/t4sOePN
	mC4tzljmmAo5t44GlzgHiTbcqidLqwFsGRl9ehrvYppQGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4k30j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 02 Nov 2026 17:58:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so659902985a.2
        for <linux-firmware@kernel.org>; Mon, 02 Nov 2026 09:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793642308; x=1794247108; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AcWvixxNenFNl/1u1V+5F/SlABXITyIvPxEuOSDu+tw=;
        b=cC9Q9PlZYMhOcn5uJQYvHETxdnNfs6NfTRCq3cjciIDNeSlzBHz6N3IydtuAHZ1p/I
         KOzSWmnimphF3fTDfSKqgEbc3vPt1DhPAvhzCzSeaZj58tEXv5NYNy2pBIrjY62O/OTQ
         oF79CDP12CBYx9TEdLD1M7b9vXqKmf++N8L0+PaD4WQm8yKPb7+Zwmdaz1uOxHar441x
         8j2GeDdGznmtEicUNxuIEZzbyFng3kCkEoUYnOyplZdUcKxJyGGaj+183zoNy4/3L7/j
         6EFne3OMUoR4/6hxar3ItIjpKW4vSjUB5cEyYHWGF6EO9g4Y84bK9UcX5mgVLQ2hfUrp
         H2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642308; x=1794247108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcWvixxNenFNl/1u1V+5F/SlABXITyIvPxEuOSDu+tw=;
        b=OyVR0NTdp8RyMEL3us5vf8CfS2FGEAYGcs4voHBjLkDJz1roP/mYRYhOQBh6otcopZ
         81UIGLZ6nEFWNnykxwwpbR2a/DL+Vf2OhBerPrRVWfGplcY8XXC9gbM6ZH9EQW63sg11
         ooUfF+yMDBt/2iosrSJuOtjidK7NcCRa1u+vGeg19sN8f/ZyxK+4tkTxKywEDll0Hbto
         J9YFruPAN02AQDKZ0f67zpREbyJ39WycJ0ZmylkmRSWWUa7ZQPO9JNF7Juu0KcqN2PX7
         CdUb6fk02/XVeOSqqdc1OB2dxWjyviOzN+kGPkEjJXLqnt9XOoShYxSJ2waJJ1vKB+bI
         2HXg==
X-Gm-Message-State: AFq9FYIAa72Id03IofWUsgvcawEFQPMsf2NJ2eYsUgfgufyKbTz9iEQu
	vY2/ZPtW4YpQtKl7pb/NqgUseKH+U3YdrgNXdfWgGln38F0Y1hjd66YIXuZwrFgNJ6PDxOjzpSP
	wpZYWfz3LDvpYEbT04GutYwtuI2ytPSrbOPgjbrFglSzyNHZK05Rd0tQB2KGBqXY=
X-Gm-Gg: AYBFou0G7hvVFCFsdgb7MiCi8Ff3Upbku5CYpYiDeqt5A4TztlEmBuvMk4nAClviRxj
	iEu6Y8KT4afM4uucb6QKXhYDf0D5meWNWLIwZgr7LUHYJ5wupuUkMLPUmFKTL/ellYXLSl8QMKN
	qp4ggAd6OMErc9YCA0Ho/rZJJuYFWzoqJuepS8GciuJFCFZH6vUjqApHoidZdjCfbcDfm80AkEW
	DmtKiwGRW1z1cLEyy8FF9hQ+te16A9gGktMjDaV20+gYKVkWSYu/Ex8DXcI8funzUMlFlIzuCoo
	OTQtKtpLGLPMZ/Gp67aguHX7yu8NIkJJkjdHNU5+tAiqP2aOLNSVP2yz4UmkOYmk/QlkHzxLzPr
	ZPH8W4SH2yErl09NedqgJChAy6KnH6c95ABr6HtUgElIlUrQ4FBrVEPqagAIr1erHayeDG8QZUx
	dqi23tidcnTHOADMAqxoKGBj0I+0urnr63hmnny2z04emZs3EP4MVePdyOhAa+
X-Received: by 2002:a05:620a:439f:b0:939:b099:d52f with SMTP id af79cd13be357-9442171b930mr1711215385a.20.1793642305356;
        Mon, 02 Nov 2026 09:58:25 -0800 (PST)
X-Received: by 2002:a05:620a:439f:b0:939:b099:d52f with SMTP id af79cd13be357-9442171b930mr1711212585a.20.1793642304852;
        Mon, 02 Nov 2026 09:58:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd5c32ac1sm890581fa.16.2026.11.02.09.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:58:23 -0800 (PST)
Date: Mon, 2 Nov 2026 19:58:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: Update HPASS firmware for Qualcomm nord platform
Message-ID: <pwpkbhcdex5pf25pygzrl4ljcsxd2oqktpvwgcnoqc5its75cv@eh6kzao7kzci>
References: <07f7217a-f80e-4d63-ac36-5466f30f5911@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07f7217a-f80e-4d63-ac36-5466f30f5911@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sRfoUz5Bp-kRitj7ZZ1A7lmJetRuvdx1
X-Proofpoint-GUID: sRfoUz5Bp-kRitj7ZZ1A7lmJetRuvdx1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3MSBTYWx0ZWRfX0TuX2bQ4+F1j
 I/YPoZpAIMBQWKt+a12b80J7pP3zo6BgLU1EDURWXB7sr1fXHaISpI3ZihXLAac0A5JLz9jr3+k
 AeYZo/Lli2GJXZRwtZv4JuX6UyjMbgE=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8cf45 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=v6EJdCqgotqnx6QYuBcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3MSBTYWx0ZWRfX+MJ4keix+DB5
 nxu5aBaDuh8JsRtLulrtjl1OO81v2Pw2InvSBsjYLaW3dpfFefOKbP5P1fVmy4ODbUzQbWC3A2V
 rSplk3LVDBqc7WMmdypQu50TfsujGb0LLYYb+7GL3YQgLqtBFPMiRsNPLKiH8Rm82u4tRXKhVbg
 dgI5+YwRHHWfqX7f9BqZLOlgyC7rT8XQDJBoaEDBJCwgzTznTsWGGX4ttWTVtQxoH7EQAnZT+wx
 HxxiziK05T3rE8j28HpX5VFEMPwfMKFizRTzeVMhtA/tb2Jax7aZnHYX+3J4Fw7u/wBXbLI0z3l
 b+JATBHRpldFbclKzTH73Ee81y2ehaRZxGmVDiB4PIwZC/XlkAh+Z3v40gaKSDMAENKr6SZBiPA
 hcDMkSkbrtwiil2g7kRukOJQPjKT36QUYL7pefrY3YSNN7lT1gU3WQ+judamkPFHmmroYilTHsB
 rPBKUemjudfg80iPRJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020071
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 12:54:39PM +0530, Venkata Kota wrote:
> The following changes since commit bda6eccc3a8f52e00696cf733b6e4f042d56655c:
> 
>   Merge branch 'robot/pr-0-1793289289' into 'main' (2026-10-31 18:25:38
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git qli-fw-nord
> 
> for you to fetch changes up to 28013a9738ae2809faef40e1d1bda735af8dd011:
> 
>   Update HPASS firmware for Qualcomm nord platform. (2026-11-01 12:50:25
> +0530)

Why is the version going backwards? From HPASS.AT.1.0.1 brach to
HPASS.AT.1.0 ?

-- 
With best wishes
Dmitry
