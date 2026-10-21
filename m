Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3017A606A323
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Oct 2026 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goC+a4OQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aiGitRx9
Received: by smtp.kernel.org (Postfix)
	id 232B91F000C3; Wed, 21 Oct 2026 16:49:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792601369;
	b=FDiH6sRAbxVhHI3QEPFvbPn9cak27MCWHNCn3TIwIRbtGdAPcLo4aaAVs4QTqOi7X+QQ
	 fEgrZN49GP0o1Oi/zVg82qsHvXRppyYcbx0b1YZKOhdfWbenN/S+QwszMeW1l44+8FqOQ
	 12H/Cm1RLvM0/+T5VQuJgZLyyA8SPYdz1VwMxdvrj6pR3dOQ47MPPhHNSQ2PDxi9Khmxr
	 CwU9Hman6G+EczzAQ5kdPwARuoyFx0Iyib1e22q48Y5je3IgbBTgXEyRZGPA10Z8a5m68
	 imEMcV54JlZ+06t9AHLRQfN7zz8qvoDBxmbKF8w5MXDphwjXIvSpVfNILnUX+whSVTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792601369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=;
	b=Z7LRbxLW2AzoTrLQGSSPp7wanTjT+O5bljbyjkchHalshOQR4cpi6UKnWE1N9gdZmxB5
	 G20Y1qm/ID09GqNu/exb+1QAmHGYDhqyZV/LNLMzI9P5PmqJxa2oC0ayVyeQKyna5hiTP
	 V8K/J595hOXn/MshSfmDFXpabmVrY954ahh6t0IspfM1xAKO0VzmvERaoFigJdGYdd1KZ
	 0sttcF3PiVEWK7gLOCNVtJ/LpZU4LUMe0ix6/ZCMCCj64DkJsp1iJfyOZHckodvLYVMD5
	 6IeCNZ9x3yv6QSlskDezrAdJr4X6dBkEZ1NxaYWfC9LIuHdVRAmUsAkzGDYszXzYhng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goC+a4OQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aiGitRx9;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AE841F000C2
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 16:49:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goC+a4OQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aiGitRx9
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9AE841F000C2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG3PqD900390
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 16:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aScArLj/kav6iD0/o6beXEYz
	xhtPHu8K7/dEbQLRbs8=; b=goC+a4OQMFZvZcJVwwGnrmMdn+Hw/jb8LweDtqux
	Ymthk89zZy8ibRIh2OsnxcuKrtrteBnDQahcx5CYa18x3UcZr7yyPQCWwzPt492p
	T4YwA/ZJowbdD+/HjUTLfXtZbZqN6oMY5kLnanhl9nydCQ8gFT6QbLEOUrTdKdKZ
	IXbxj4mkUZfhTNSqFtMfIKpO+SVuD49VXv76OCFtZ5BbtaJc9PbHBSdTiKYMNUwZ
	OoHe7unYesBmOts0ZNBgz8Aw9214R37v2egEXSs/jwlopYBHSmEKXRaXxOxOQiYy
	cpWgSr7P6W2FfurS3kYLgKvk+TgBQCB+fw16CdWXqluFhw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2g752-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 16:49:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179a556c43so20292826d6.3
        for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601366; x=1793206166; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=;
        b=aiGitRx9KuS98CleJ4TeTOJ+9Wm7S4H5CO9U5JsTSdN5lprU9Phy96ALMtNAZrF890
         mAvjmXwkvyjgDlWTv2Y5Tmq0ysnptwMAjBx7SkJ81IIv6tve6lnx8z+CGi6CYZr4682n
         VaS6mZvOwifYNfb4UvgM6A+tWj40wRUDMn45npEfmY3o52YUmD4moXbA/WbBaUt8oXks
         HHjcj3l/7J3NE/Uc/r29DrOmt52DZz8LRzUTLc8rfndhzBuvW6y8kxKFks+tB1dg4o4P
         /DMseCZ01gIJ0tIRxdNltVTTj1OU3zKnPkkOfAyFhlpFk+f2hURxFuaRFyL1xcByIGd8
         G4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601366; x=1793206166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=;
        b=ihSnOrA0LNWYmjAWBIHFdrCL2Ch2tdSpue94PRjavu1CjSXEX4IPbEv4KJC8sI5t+6
         5SAF3SjkCbDbNkdTLhDqquPbA3fK4mrSQbtidfOBIE4F/IzP1rq52XAqr+1JJh8swGlO
         ojhts4Tv6jt+jc9QRMthM27QkNm8swOn1ytmEA1yjVMOTmO88PNPNwt1wMbaoRN1Kc9d
         LQARPsIdUfvRDUCEZUlg2rFSJ4XMejwK66BCl4XC49B+lD3hFZ/aV2Yh8USdSoCouW/W
         cBWh+aayD/F2Ij2FlGtkK6J3wMR+IgWugUk+GdJFoiIFA+lk6LxpoB9NIGi2WUQ8SxKZ
         D0/A==
X-Gm-Message-State: AFq9FYJCNnuQJwimVtm+cT2zyGN2x4XvLFS2hL8QxhmvS3cKnpqYEX+i
	wS6Zt5fjZj0XcFKG+IraHSI4augv9kYLfE+HjiAq3WZBTQqTRLTSk1Lp+z8R0Wyi3D970DApH2C
	qoYquQAqdJCbvY5w2bQVJ/KOOUoU6biCrH++gknsoBd706SUVgZP4vk3YQPq49JI=
X-Gm-Gg: AYBFou1RJqzMpZfJD2BTl8y5SSZJ+OAVvrNi1nIiAlpnd+2vNIWmC+66QvpnZ+dTuR3
	K6m7E4zpaqd6sr7glITxxgwYcGfFAvQKS3VkcmB1TUCmkpxCcMuoCSJqgQeDF9SMOoDsuvwMJIg
	6zynDlIp/UAMJhGXrVylzjBvnRYQQ5rK/0Ctn1tV8MMSNZRGjpXRonFE2kdC6HpVh2eHxBw1ju8
	C03Zq2pAitYXJjX481aut5N+LJq1PPwgV2OFuokLziiC2yAMKVDmU1lXUoh4NTfSCtd/MEzqFMz
	54wh1OnpJaWiJvurgJWGpeV3/iKJaGhGoqB4D5/QaQCD0Ci2FMoKsKyBDErx6SZwpiWgdoWjx4p
	XTr/NxXwYu7+E1/a0SpCqylZr8XTHzawvG9mRl/vnm0XVfEHMZL6HCB60MrUKkegTToQGHPc6Oc
	NArXPonqygcN5p
X-Received: by 2002:a05:620a:3186:b0:93f:571b:c72f with SMTP id af79cd13be357-93f57f05bb6mr541415785a.20.1792601365623;
        Wed, 21 Oct 2026 09:49:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:93f:571b:c72f with SMTP id af79cd13be357-93f57f05bb6mr541412585a.20.1792601365178;
        Wed, 21 Oct 2026 09:49:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f4df158sm1332271fa.2.2026.10.21.09.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:49:23 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:49:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261021
Message-ID: <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
References: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NiBTYWx0ZWRfX/glkvISuBxg/
 CYnATJnd4Dr3jDxgG71VOwj0DdsRp5ziE41nqPSfDlzymVriqq+VTRAbFmoMYnCXDMDbqX5iIZu
 l5Uv+hqeW0g0nmU4bszb6SUkvMsi5wk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NiBTYWx0ZWRfXxS8WukTkF2zG
 HdkXL7lDKrX1AYYeDmMEuKu7veJZe6bjmkbIrOfQwVif7rZKcvQQlpnzOdjvzBwPzhrieSUXnTG
 6kZmTZAT318vT5XcXvUe+iJSW883oSAq0+JrC1Pu/u/VV4/T/jRPSJTG+oHZ1XYM7jhgrvUxkOl
 eGLCr+AuSedglaBiMh0eUBrG2RHyxUv4CPTsA481uPN+2m36dV1PiwwPzWH7Jswz9yoSK64qgHL
 W7BPzdrRiLokQCI0+3/04CmKc750fmW+dDUspWWswT612gKY+NceT8NsueNG1p1SrAUt7HCk8hP
 n0cx/RnZ1U4u4MfRS2DYRYuAcD7WV4TADnYWHwUyzp4tlf+l1tgrEZ4D5DQI3LZcdZ0hxOvazHp
 qOmIiuOUokKdsP11DYJsKwph5kSM5pkDXtV/jSZz1Wae8tTDSZs1TvLq79i7bBU7J+fMEUMdiAU
 LXexB/5JjuXAFJK9Exw==
X-Proofpoint-ORIG-GUID: 99MKXHmz_XvpK47Z22lDAGzwrZZSqp90
X-Proofpoint-GUID: 99MKXHmz_XvpK47Z22lDAGzwrZZSqp90
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad8ed16 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Cll3ooqCA_IsHNaTrZ8A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210066
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:30:17AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> 
> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
> 
> Please let me know if there are any problems.

"make check" failed:

1. Missing "Signed-off-by: author information"



-- 
With best wishes
Dmitry
