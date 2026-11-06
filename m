Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2829A606A326
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ad6WMz3u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S6gWf5Zw
Received: by smtp.kernel.org (Postfix)
	id 19EF81F008A1; Fri,  6 Nov 2026 20:41:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793997687;
	b=Fum9974Ul1J9YsLnL0UUHycC5ZrsB26DYEOuZttRhhJX01mxWoXbHqsbC7ZEqle/aoVN
	 YL0PIp7vXs0A1LVwWVs3tGuaKZpVBaVBSouV73UTcIhowgj49b9BLAkvmpzAql/M41BEA
	 UU++oNfj1ShVfeHwpHSMXuwGOCaWizSEg6+ThwUrQz7hSExCAqod/wpzZHVhQ7uyUJmMF
	 9pxuopdrOgjQKJMEpUqNi0Rl49pG01q+nr2ClyauipYxqYeTfMOGHnRjdXQj65NucBCcv
	 TibA4cTsW5ZeQh417bcDez3V7SzkJ8kC4BhdKy5d2FK8kni5MUAkzkPVUFfEJfGyZYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793997687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I6jlTRXd6HSD1aqNOVftbhY1UpPwd2uowUiQxaXT+o0=;
	b=Jg74Ymsu8oFwneDnnFRu/1l+JgLobnxBFmewmTDKQkDBDG23RlYuT0Xo8WeXN6N/ub9V
	 q7Bg1GfhxAPC3iv7Kuzli8tegOB5W9mM0UhAZwBPxCZA2fLwIAQSpixGy3/Z1NQWhPL0x
	 M9Y+Q2crco5bB5gTkegZjaMLJ4A6ZVE1IiSLqEDRI+1GC6+w5PDmeiZPcUSlesDP0m+3u
	 wgKkRGlxLKXiD4lI9ISdOkcW4gacQq297FF7KCE5ql9F72oF8o7XP4YJi/TTdhoqAysoB
	 fNj1EW349ODsezcA0cc1LLu8JRJfKyczrQ15elqoGXPcP9y7h81XZdrWejPu1fSK9rA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ad6WMz3u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S6gWf5Zw;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 617241F0089F
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 20:41:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ad6WMz3u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S6gWf5Zw
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 617241F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Ht8DF476113
	for <linux-firmware@kernel.org>; Fri, 6 Nov 2026 20:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I6jlTRXd6HSD1aqNOVftbhY1
	UpPwd2uowUiQxaXT+o0=; b=Ad6WMz3uVvZVhCYMHzDx1hI60HoNXBMtgk1off8t
	Q5loEexKzqQ6Hu/Vk+qmlwXdnirMRlHTpt1vfHBetPjUSYXFmZJ0bofhjA4OGY1z
	b4JK9IPigvUgmneFa9Hhi0JRnhgKRJOqdat5GF8EGS9/EXewDoNROeFKmJzUL0dJ
	g4otUIlcOzHRYneuET7tVOxw5ScVZ4riogcN2N/t9xgEOxgLOmIXxEn6yeZXrImw
	iohx8Zeo0RFx6YxVP1FTGVn1f/OZiASfWpjn7R4peX5XkepHWjs8hSX4r6suvjZ3
	Lu9C95/3mQMfHZRrdKGxh+DQETCiSepJcmj+f8R6yTK5Qg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk3wgsd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 20:41:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so206776585a.1
        for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793997679; x=1794602479; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6jlTRXd6HSD1aqNOVftbhY1UpPwd2uowUiQxaXT+o0=;
        b=S6gWf5ZwlXv68taHeCoXcCUyOEcTSgcpCjrx27KRnm9bpen3ylmsPRj6fAqH+MFVuj
         DewRE4YLZMeyQv8WYJ4aXSWajMhY2dWmcPxsaSNvnVkqysBITPmeWi3Vp3SKPt9nce19
         CuuM0rLAL8w28qojzAYTnycuhX6CR/2qkRvb61QY2Ash3zp9fZ7PevFOQ1wnjl0zAjDJ
         x3cF92LsJPj2BPUE7Yd3SedWagKE8LaqC6wyzY+4VSHr8e/kLNKd7yeBkl/XOfFBaYFe
         JbhUYG+gzvhR5xMkXEfLCWavcQAdIAgIDhTtE3XUVgbPsDzNsl1MmolvCI2aiRXJhN/K
         fB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997679; x=1794602479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6jlTRXd6HSD1aqNOVftbhY1UpPwd2uowUiQxaXT+o0=;
        b=vUx8D7PzqRricg7MDwKUcBbF6IhCyTcct3oQGM4zNMNaZfImjbYGbzTXAdXKsRnduc
         xfLIL2DYFTFindbaPCx2H8Cm9iXzXdA8Q4t4cTEO4oMbOEWzoiExBxxaCo9hC7AjW7+4
         40DOKTTcElNb6kbA+ihnG5D3bCW0Vsfy8bKzqAxIhzQECJWtHOOWNaRa/vayRMlwTMZv
         RSqBziecbgrSEzLbxcrdHN99yonbdNRUSWdNV7YQihiABeU3Ar3uSv0laxXVkeGB27qD
         oOhiNVCDoIM+57p1Qjw72TO3XAr01IQ1JD3uIv4+H2raMhurXqyVG9W8NOAzkJl4jgJ1
         KPhQ==
X-Gm-Message-State: APuU4Z/bYP/Gl9mPcRGyC0e/wpZ97axvXU1pmYDJgWIm4l0eFrB/Fp9u
	3pfvq4imfYnJnVxSZ/uW6s6QP+IlYrUYfq1g8o9GSQYh5fmNUVJcluT+911912B9NHwchMJqN9S
	cYxjJp7Xqj6tss8ERdn7UNCKVK5EB6vUoiI53HKk9hcZf/yNa1uQ2BuvKv9k5wr+b2KaCVsI=
X-Gm-Gg: AYBFou2fKJW3MRobNKXZNgxNQNvGTQrsdyLWcLL5cZfCHy/UPb3V0HGT/pbwCNRDYvT
	DYmIdI/d6GFUmTnz1EDYthoIPaZD6jh84EioY3P1Q8aI49eCZmUIE027k1llBkD1g7ZAnlaWjMo
	ytutDmRzVBB/L2sIMowtO5Ne3uU4fM+BDstdwij07XvmPMf3Uusu4mTHZLpfdbVz0eUuRyqXQMR
	awq29yK3K7flpCyf6FsdkCWcZ6r1A7AcSJMzP8Duwq9d3Dvhr6cIG/M/r64XHk1cbHkGvJuE0BB
	moGq2ltYvZTGdpYGRte/CeGS4H7hW91AnPDubv4G8lSa+W+nCx0bqHRZjWGRjN/4ocAtTr4wzvP
	ihwdfgxAZ/FbWpZ6tYaAjMJ08gYuqUB8zoacMMxFnYvajZ0fDYtsstEaHZDQvcQqOV8c3f1BroM
	AeiNcECssBPuyKUAWL3HdXjilO7fg4IxxMZK8MaGISS7gUiRhNfwNh/MNNz5PL
X-Received: by 2002:a05:620a:404b:b0:93f:2b23:481b with SMTP id af79cd13be357-945f349b4e5mr621344885a.22.1793997678632;
        Fri, 06 Nov 2026 12:41:18 -0800 (PST)
X-Received: by 2002:a05:620a:404b:b0:93f:2b23:481b with SMTP id af79cd13be357-945f349b4e5mr621341985a.22.1793997678144;
        Fri, 06 Nov 2026 12:41:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acf5fb8753sm4483671fa.26.2026.11.06.12.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:41:15 -0800 (PST)
Date: Fri, 6 Nov 2026 22:41:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-kernel.supreme403@8alias.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, baojun.xu@ti.com,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: Re: [PATCH] ti: tas2781: Add firmware names for ASUS models without
 a speaker ID
Message-ID: <3drvkgys7dre5tegwquecgcwezxw46u3trp7rhjtmzgdvqyeca@steei6i2cskt>
References: <179396478879.8.13751503013951596382.1751156862@8alias.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179396478879.8.13751503013951596382.1751156862@8alias.com>
X-Proofpoint-ORIG-GUID: zGDtL4NU1YOfUB71YvZSoRVxR1M-2H15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4MiBTYWx0ZWRfX1Xo4x1mRe8sh
 O8YOpqsFFPLHt52uEKKM1miNiIQVrYnYrznXDqjyKC/KyTl0R0ii0ZKKtaVcm6ADPnQFh7SmQvn
 xB+TmuQZDwyNOtLXThOGCf16NF5J6bkO1/fBiFyfuZWvsCI66mEfqpAzU3vd3U5uAE3NxGSuTli
 NiwRTObwyp225n0HFUvZYRKXxnDMMBjYGiQN27YJOiOu/FaMBKTmSZ0vrLNOczCbDRBxxQ3bVE5
 REmxDNJkkzvoxvmPzlXLKLmuY5uX72yniUlKOrksyL+GH7jEKv2isbd1s/qErVBgA4orw8Ukogc
 i0oTMytdQe/R1/tgNBKMkonQ7o6TaUB6ejIKSsGLPx+PQJjUCyYAKEwax+Dyr1FsJ+bthmlQ//e
 VdSiFx96mVi4COqhc0IQThU/6WZ4NukDdMN1zeg0JwxMZ7WTTMAVydWb51vGjzmqE9auMDm/qe4
 oHTLvV/dqvQJEtlkeew==
X-Authority-Analysis: v=2.4 cv=a6OlZkSF c=1 sm=1 tr=0 ts=6aee3b6f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EyC9BqI-AAAA:8
 a=If40-3EDj7x0ToEoNd8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=V1rNeAFqr7mUYiG6BXD5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4MiBTYWx0ZWRfX5ruYX1OVdj6n
 Bz0I15ngYypLMl3t2+IcJfNpUAGmRSsDHrHIFIKXW5edRemDeQ3CrFCgetvcZUz1837gqVYUNGx
 LId0B+M2CkJYbeFj5q6Lha8yA3TsO0U=
X-Proofpoint-GUID: zGDtL4NU1YOfUB71YvZSoRVxR1M-2H15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060082
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 12:33:07PM +0100, linux-kernel.supreme403@8alias.com wrote:
> The TAS2781 HDA driver builds the DSP firmware filename from the codec
> subsystem ID and, when available, the speaker ID read through a GPIO.
> For ASUS TP3607SA (1043:3e30), it chooses:
> 
>  speaker ID 0:       TAS2XXX3E300.bin
>  speaker ID 1:       TAS2XXX3E301.bin
>  ID unavailable:     TAS2XXX3E30.bin
> 
> On TP3607SA with BIOS 308 and Linux 6.18.59, the GPIO lookup returns
> -ENOENT. The TAS2781 device in ASUS's BIOS 308 ACPI tables defines only
> I2C resources. The driver therefore requests TAS2XXX3E30.bin, which
> linux-firmware lacks.
> 
> ASUS TP3407SA (1043:10a4) uses the same naming rule and needs
> TAS2XXX10A4.bin when the speaker ID is unavailable. Unsuffixed aliases
> have been used successfully on both models.
> 
> The patch below adds the two names requested in this case:
> 
>  TAS2XXX10A4.bin -> ti/audio/tas2781/TAS2XXX10A40.bin
>  TAS2XXX3E30.bin -> ti/audio/tas2781/TAS2XXX3E300.bin
> 
> For each model, the speaker-ID 0 and 1 binaries are byte-identical, so
> either variant provides the same firmware contents for the unsuffixed
> name. These links let both models load their DSP firmware automatically.

1. Missing "Signed-off-by: author information"


-- 
With best wishes
Dmitry
