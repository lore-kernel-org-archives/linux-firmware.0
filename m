Return-Path: <SRS0=vr2A=GF=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D9CC5AD5A
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Aug 2026 12:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6502B1F00A3E; Wed, 12 Aug 2026 12:18:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786537100;
	b=KOoUg5Dv7eQR1UgBPhqqfhYXle2L8tB1kF0rcOGnMx7BI1IGC3WbtLGK428m1NAY9j0I
	 W6ZuNuVHHMKTovfvnsY41jC8hEu4dxxyNthwTarFJOWUCWCC/OUzqoIvVanHBjT45OgD4
	 7C7Vl6qU6tlr0fnqXE905OvCXXJNc+WyCcec8RnmAS2FKkWPySG0kJrN5XPTZV6cfpqW6
	 Ax2Y2bDtzybx3UtPvIptcgB9IaJ98jfATqYsko76+BjFynsMbTzlYD/k581Wzxef2JaHZ
	 GaTsXP8z2RFESU0Ia1CXYSJybuuL4c8eyxYbZ1FCtQXk7iR4j5Gpvfw4jBn2PPbCmFg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786537100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tGlLvkh4sfkP4AlQ4bn29cY8JPK9Rpbq6T71tgZAwEQ=;
	b=haEiOQWjdNJEfez/PZfuY1hrtaYpZV/S12losQ70cMk87P7VXCW1LMJifp6JVfx1iosz
	 PEN1pJjm1oYlf+TS+rliedrxWcQ/UG2RNQvP2V841lN1kNYpsPA+5ur2LmLAXmOwNmgJ+
	 Tmp8x4tMRu/NHAwcI6Jx89l2s3wdFV7KAFtl/hkkNye7mqzXPrjZ2EEywMo63kwt7DIlV
	 cXKogWEtIqF23Lb0FnjTns+r2Qa3ssa3eynEF1k7v/tkZs3secSe2qamwKx+UljT8yW8h
	 JLrezjdZrpk9RetBiZKs8Cl4x0Wo5kHlGq5ZzgdQVuU1ivoVBrx1AjfTabjGqi6SVLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="M/YDPKjz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DDlbuPco;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A814D1F00A3A
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 12:18:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M/YDPKjz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DDlbuPco
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A814D1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4PP33619474
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 12:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGlLvkh4sfkP4AlQ4bn29cY8
	JPK9Rpbq6T71tgZAwEQ=; b=M/YDPKjzlBLkosmEtK9o5+5woor1B4STx11rhD5Y
	1b1YARSxM3d6midfmxeql7UIGU0Xs5+sfaflzsz9HL+Cx/G++CL30/wHzNIbM2mn
	/WOThuhu2PPIn0cWa/+h3dpNW2+EbERFBXsWgGBISZPLtNU7zN0M4dRr7XF73cOq
	gqC6Nix8cDBmId4GAA2kovRiEH3rx8m8yfAmNKddzgROvQiTS/jHBBnD3P+s+3iI
	BzCZmFYhfkUbpETSas7H7NKXhpjlcjp8tI5USyBxNBaMymNQ5rGykuolONEvecQ0
	NVkjMOfsWogFqE+fLhluzOooft3zD1TTVaffVcIITEeuBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2srxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 12:18:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso6975771cf.2
        for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786537098; x=1787141898; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tGlLvkh4sfkP4AlQ4bn29cY8JPK9Rpbq6T71tgZAwEQ=;
        b=DDlbuPconFUDgfKsB/8o7PdcxXX2e2H16PNf3AEAYpN8kyl982mLcDztLRyzb28OIs
         mfMsdX3OEByca5jgPn/G0nxn5Ap/wL+minpbqG2AEYCvrz7+4SfwNyjcqvp3OwbDVKjL
         fGoZP9eK4NfP0hQQBUKTvVC9ZT7Jea/YjdbtbSPgxiHDdfdMq6JJP9dM+ACd5UE/fWTR
         deeqN9oHh/JJOytzzq4kA1XAh1lIRrWAyCx5LfLr1fmoVj7FNlvn411PqwMOihxhdAm/
         1z5+nOG4lMZQDfHomCGX4doxDJc+kVNGEc6EC6BaMLZKWli5ww3MbhsdYy5+NMglpm9L
         E9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537098; x=1787141898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGlLvkh4sfkP4AlQ4bn29cY8JPK9Rpbq6T71tgZAwEQ=;
        b=Wa9Y1tu2KST/la8vi7pxj/AO/81oH0vRX06CpqHKlmuppq8xYFP+fTshFK16fBxoyh
         jOqoq4sOJa2WGNwaKlImLP2VhkQ4TwheFq4Z7BQmtmrFC+s1cjdcfIMb5zOqG9Omaq0C
         7y/C211mLw7avPVxLKvbBAOojh1Qy5e4Mz1fUFEfTmESrGDnSt4P1MionBx3Sz0bmi/C
         ce+yo9MMOk0WMxcukN6qle8HQX9qO5mr4UNxKGSnPtDxceU0yWUsxd2lHEcrSUYBY4PQ
         ZBJcvLh5dve4gyFA3wPHj1JtnFF+jlcgjjFSM6ix0wpq6mHGjmUhHoE1lC5PR134I71x
         MiUA==
X-Gm-Message-State: AOJu0Yx45DDmQS8rHW8SfajQjMCjJRUbZVDYoYLxe3ibnJvRaBZxinD4
	ekFpuEbfblFyWlu3jTi7Z4qAWyoXFYCPv2QMDoMt3Gm06olQgmNYVAh0HsIJ1hQfdaiWCxtWiuG
	lJXyKC1wPfPkP38Xh/RNGMPyGILXSv4cYJz16qWcFX6SEjunq5Pt9lT6bq6T/HGg=
X-Gm-Gg: AR+sD11S6MInqDVOeK2Q35AYwaA9Yxxht2N3DmHaDB+1MOqgt2me0ZvjvJ7sqc6mukt
	V2WHklsDFfZaEXVGgfdXRKIE85eukGiblx9SHyiqA9e8hpBcA3nevXMhyNcYsTA1MNVynTv+FB6
	sqUI6S0V1Cr/iREAZWhjD5NyeVNDwHJ9QaiSuF9jhLo7JNh49YJgaIfWZY5z6dhfrkoU8u212h6
	FVrs3QY+xdaLcI7pTDFfrWzi5UbJE/4JDqNlFyUKZ70X+TLcvRTv7Zkq+EPAoXhoLqPGqgF3bq3
	M4y9wrPUMzyr/HgIjbQhU5bSMf2Rw3o2mv+Ym+RdDczKOFq7yLGusfOok6gamWzM4gviBLNETFI
	p6nRhRF7+Vin+Ix6oPbTKoICqMURxCy5vqywxh23kqK+4f1kWQDgCNjvee9eZC34fzqr6mfISyN
	eJERnbCASBGYEA
X-Received: by 2002:ac8:5a13:0:b0:528:3b9b:4f54 with SMTP id d75a77b69052e-52d646a2f1cmr37360761cf.8.1786537097727;
        Wed, 12 Aug 2026 05:18:17 -0700 (PDT)
X-Received: by 2002:ac8:5a13:0:b0:528:3b9b:4f54 with SMTP id d75a77b69052e-52d646a2f1cmr37360451cf.8.1786537097279;
        Wed, 12 Aug 2026 05:18:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a107d07696sm3698411fa.4.2026.08.12.05.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:18:15 -0700 (PDT)
Date: Wed, 12 Aug 2026 15:18:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: add NSP firmware for nords platform
Message-ID: <frgcq2r5bogzqtv2ft62btse6ns5iy3s6lfebes5iskrposcz4@hezpjlc4wgmd>
References: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c648a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=cCO1o9H_FYytE-6F2MoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: HKfMVxxtMVwUryfDpcnxOl0-cN2-uG1C
X-Proofpoint-GUID: HKfMVxxtMVwUryfDpcnxOl0-cN2-uG1C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwMCBTYWx0ZWRfX+BS+JSyT/MPN
 3pPvwGCFV/KyNpmyOaP3NERwNQY+wfzBDEJfSh/i8gaFnenzZ64llDqM9UImVa7LNfNvWEZM7A2
 XpuNYLOgXA5WDhrSpoyMr9alaiyTqUs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwMCBTYWx0ZWRfX0kEvz2mcTFqi
 0R8Pip07RSgajxXqx0ALM6w6aSPO/eW2XG5djEzLArG7PLET68eG03sFWSoKXzUWcyIISQyk6UW
 0ZhROHQUKD57rcSTY1QXBtneAeBSpxb6H6UMFe61Vi7HUfRuyrXPocrVedQ0ztTlbLCB1Mq06T5
 PNW/BZezsBiWtp6y9WBWp0z7Mu25kZ+tIi1GvAk0pQUjWJJj1XCe80R6CsHhaVjwIVgghEtBAK/
 0GTFuFmwdZ6McBSQBkDFK/yPOatTAxWqXoK9g4E6p5N5h1eQAZluhT1mYQP7enyxfnTopiDxNXD
 CGCqDTCnT1ms0SaWFkcjzq/rTmb1paVstdkfHfwDy//v7F81tuT7oOjCCISaC/15BaEwO1JPE4L
 kvAZ2uWyT94b4luhA4FWB2Gf1NSZhms4aHmaRxMXzJ6aExwzT92n9q3WqCOPUNdWnS6F4lPMa7n
 /K28aNhdb1ljtrhXDZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120100

On Wed, Aug 12, 2026 at 10:53:27AM +0530, Venkata Kota wrote:
> The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:
> 
>   Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-nordsnsp
> 
> for you to fetch changes up to a31906642ab7a73f5759e2c554fa2065ca548c5e:
> 
>   qcom: add NSP firmware for nords platform (2026-08-12 10:48:05 +0530)

Is the firmware for those instances that different? Can we please have a
single binary for all four CDSP instances?

> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: add NSP firmware for nords platform
> 
>  WHENCE                   |  13 +++++++++++++
>  qcom/nords/cdsp.mbn      | Bin 0 -> 3347164 bytes
>  qcom/nords/cdsp0r.jsn    |  22 ++++++++++++++++++++++
>  qcom/nords/cdsp1.mbn     | Bin 0 -> 3347164 bytes
>  qcom/nords/cdsp1_dtb.mbn | Bin 0 -> 131072 bytes
>  qcom/nords/cdsp1r.jsn    |  22 ++++++++++++++++++++++
>  qcom/nords/cdsp2.mbn     | Bin 0 -> 3347164 bytes
>  qcom/nords/cdsp2_dtb.mbn | Bin 0 -> 131072 bytes
>  qcom/nords/cdsp2r.jsn    |  22 ++++++++++++++++++++++
>  qcom/nords/cdsp3.mbn     | Bin 0 -> 3347164 bytes
>  qcom/nords/cdsp3_dtb.mbn | Bin 0 -> 131072 bytes
>  qcom/nords/cdsp3r.jsn    |  22 ++++++++++++++++++++++
>  qcom/nords/cdsp_dtb.mbn  | Bin 0 -> 131072 bytes

-- 
With best wishes
Dmitry
