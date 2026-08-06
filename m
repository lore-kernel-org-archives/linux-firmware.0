Return-Path: <SRS0=isgf=F7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE396C561E6
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Aug 2026 08:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AED6A1F00A3A; Thu,  6 Aug 2026 08:05:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786003523;
	b=M9VFM93QbIkr2PnYjt6j2KFAP3SBXc64nERC5jzcWXoW/nWteOBu8E029Ll0RfA22toR
	 +jXx6uA4hJTARnyfunXsF1TiYxpFXI2kxXRoaqca/KyYKI3nCmFjzUPqWifHNoGoh3Tfj
	 qCtfeMBHpEo8lNmvBHbdtyMee7yd5K6zWSKqjwfu3gtsfZUsGMnEz4gAMW9dPEUxjusRL
	 TZkUAWlLXqeiRgl9n4ehAZGNQDzddXgRmWwmks3h1RXcqHGGpvGQ8U+yzODbsZ9NfO1Mk
	 Qaebwt+58GDXxc/EQZyiQqanwpngjMtmmTtAZu62zpuA2K3kyNEIhQzNcwZTzbZ2zXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786003523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RICqsw8vvvpf6Mcn0dFhc6hTeN1pZTC0Y3pcWjqeE6A=;
	b=KDgcqGIPq3LBLMTewj2cMKVMiTmoVS/N4Rag4ChieyD4g6ymeUJAEK/bzJPNil8oLCCK
	 j4FrVoqWzn7J+wggGpKUX+MGj/jGs/R+i0l8OWCB6FxqIj5bUiTbey7TYgdwbDrhvVJD1
	 A6DrNVruxBLEs04wWkZk9uvPNlEtOmMrn6t7jID+yBV8boEHcYLw5uVBMW6AcK9Fd29Rq
	 Vvqqgi7eLaJBdhiN9uCn1FTAWg3VxtD71i8F3yFN/pJHD4b1y6+6R0nNQsyXFOf3KyDiV
	 fvJm6u/472Qa36rPvOa3s/R0NlK/nUGQvLk01ETxaip1EIjUwmCzPpm/xBTfr4rflZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d2FWsa4S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ea7VQNgj;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D7DA1F000E9
	for <linux-firmware@kernel.org>; Thu,  6 Aug 2026 08:05:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d2FWsa4S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ea7VQNgj
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1D7DA1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767M6Mq1286781
	for <linux-firmware@kernel.org>; Thu, 6 Aug 2026 08:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RICqsw8vvvpf6Mcn0dFhc6hTeN1pZTC0Y3pcWjqeE6A=; b=d2FWsa4S5itD4zlB
	hf6Hv9LY88PY7A5iG9FbLFHtXvhhQbA/kEblyPyNNz0UwmhJfpWJfAUzDwwGAm8R
	kKhIHwsQGSg8Z19Qz68igq0enf/ygatKXA1uzu5b2Xshj3rZH/dDI6orMPvA9wDW
	18tlqOl4DMuXrlQogJyd6ljcxIAVGOo8mJDXC+KFWvWgnVbPjiiZkJNV28rGJhvD
	ylQ3dI+V9E5qub+5xG3x58Osrarnaap5nK4rMflyCrNO3rVY9K0FAqdge4VlP565
	BipHhqTDueuPPCRst8/yvh7MTb00PQBNYqCP8t8CtK0RZ7PtvOMxsaCscDtqnzgt
	F5TYxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntng5ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 08:05:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso20656741cf.2
        for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786003521; x=1786608321; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RICqsw8vvvpf6Mcn0dFhc6hTeN1pZTC0Y3pcWjqeE6A=;
        b=ea7VQNgjq8XACMxeWBwX2keIBJwew5crYQ76YlD7hU7U5Qe9g6FoxuM5eXNc1uexd3
         tHIpuARnRSvnKFsUiF7E0n1HbfHg/sybRSed0GztoQoDcMqA+El4BeOrTsDoLS14DjUA
         kD0ZZWPi74KOLDgfEeBCqW64vA6EEYVjC0kyCzqd3xdIE+CGykQOw68JoK/lIImcNPi0
         KuA5SggKwfa+IFsXQG1ncH383gClpu9cG0Z7JuUP9AA2hyPy1qva0ymxcgXB1DwWQYsD
         lX+k+BfbSt6Nm4S3iVxYn0UzR7ZnewwKVs+fFw/YMzktZPhDa6ebShxWeALCdmlDeB7G
         p1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786003521; x=1786608321;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RICqsw8vvvpf6Mcn0dFhc6hTeN1pZTC0Y3pcWjqeE6A=;
        b=CuReqC6H6J/0z8c2JZjb4PLPb2v8sRh2Zid5EZImx0exs2p1XV2TLgMVebg0mYwX4y
         8KMwPtjzLDnnUmOsUoon4ltfM/xIBqlsixeAODGORpYHBcfFWzrrLf58fGva1mYVDJ1M
         /lzq+rxXkZw83cbJSXAZFNq915kr10YUg7lHtkc20ChOm+MLvj/Nj3Lm/Q8NSnpRpQHQ
         j2GquhvLAzSHSMiDVSAc+e2rx3Cp513E4c42hLdQbCeeY8mrZ2ARM7+QWjMDgb2y68AS
         ilitPUpWsyjhhTSetzHSFPbhYSnElrSUGm5wnWZ9mRlYurR/pJw/5T81cosH7RbNIh9K
         y+PA==
X-Forwarded-Encrypted: i=1; AHgh+RqA4TJAS3OviFP7HNG5RhvlVsSNwrxTszRtFqbKOCXvgs9IKaW2OeBe7WdYSTuPzf4IPMVYRJaBhVu+IWYStw==@kernel.org
X-Gm-Message-State: AOJu0YyIwL8hBR6/I5mbV7y5IG/MabSN2mz6ho0xjmAwMAQ/BW3/FcvF
	XNVdpumpaMrm+RR7fxecPYgyHY5VgXHaxiFAyAA9z8ZboWtNqpwQkS1x6sxq8rDlt4XPxgsVmMH
	CBZpZukyF57t2HbeWBME95NO2++V4wtejvMlVBxRazwRfqWZ1G9RvFMiK+1tRvEo=
X-Gm-Gg: AR+sD11XDjzkqsxRnAyTozF38GSZP8EI5FSQzuEY1FVQZDRwaxKSKSO+vZis1I5hd+0
	KNb3pMbstwkcGU+okibgNQS3i6nS9FM9SlpHnOeU0h9mUkyql58ShM/CVqGjIpP0jPQCP8YNZNp
	rNh3KkfNSQcjkI3DALgr3kF60uRSU4UeunWwvP+88u6Kpbols5VqVk7zZ26JtB/bBJlopVq5HqY
	Zqe/KRmS8jmYOpbIj8aryNvZ2jC/iD7swo5sS/31bXK/a5uRkYko9fvw1ePlc5HZl7Fa0lqV6Gy
	sUi4NZTuAHGxV2J7CAhyC1Xyt84+l2A61sd/lOLN321LtGW9oePAUbQ8iBtkfFoefhj5jqlvaZ0
	zDoxlv8H+aWvZB33moIOOgjxuSMwIpKKHA+OI9OFvC1y9paqw5mIcedi0dGTQqiRKo4I7o0RDkD
	4y+ZpERSA5UieKdw==
X-Received: by 2002:a05:622a:480c:b0:51c:1c73:5943 with SMTP id d75a77b69052e-52ce6145233mr148479561cf.23.1786003521482;
        Thu, 06 Aug 2026 01:05:21 -0700 (PDT)
X-Received: by 2002:a05:622a:480c:b0:51c:1c73:5943 with SMTP id d75a77b69052e-52ce6145233mr148479101cf.23.1786003520994;
        Thu, 06 Aug 2026 01:05:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235d38sm559497e87.16.2026.08.06.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:05:19 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:05:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: WeiTing Lee =?utf-8?B?KOadjuWogemchik=?= <weiting.lee@airoha.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        Lucien Zheng <lucien.zheng@airoha.com>,
        Albert-AL Lee =?utf-8?B?KOadjuWutuWujyk=?= <albert-al.lee@airoha.com>,
        Joseph Lin =?utf-8?B?KOael+iUmueFjCk=?= <Joseph.Lin@airoha.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQ0hdIGZpcm13YXJl?= =?utf-8?Q?=3A?=
 airoha: Update firmware for an8811hb 2.5G ethernet phy
Message-ID: <iegslrb3fdz3hc5v27mrowq4plvkafeeslg5b3v5ps4rdfgdrr@arzxmkbvwymz>
References: <20260805053652.1384026-1-weiting.lee@airoha.com>
 <7vt2klmqyntyscjcffdsb72g2psrbfkobcvjubs5ihpdvl24zi@fdrcysv3mher>
 <TY2PPF54E124228A0732B1B0CED2ECD216384D22@TY2PPF54E124228.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY2PPF54E124228A0732B1B0CED2ECD216384D22@TY2PPF54E124228.apcprd03.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2MSBTYWx0ZWRfX2mgfZWNgTt+P
 Rzg2qzKolV53Cw0XqnWEsEJ2a+pZv4mKDj08P5eWmVNVcmAd81D/210eii+1Oh73amry+T+JQwd
 mm6doUKgsjBBZx1Lgsbq36UjFgVrPoSN/TZCTdw5AZepBaNDMMfmLUsYRLUR/FqextYGVHXmHhN
 C6lo+I+JfEiZ/KnDfxZK0WL0nI6c84j+f+mQNZxnXFz71B/L7337eD+5ERpL2Fyon5Kti01Xm/l
 7hd806/+BH+cQGkqHAOzvkfyjar+q1iYmzlgfCTB+ukBzj1zx5pPpy/f4pxGA6pp1LZmMI0eVwC
 dP36l5Tcd/4MehiiDkk1hKLzG4AH3RUq9MFtEvzQgc+9lQRgFZcyJT+0FKV8OzkbjKHuBkf0bg6
 QJnlaLN2QKrduFLkfWqcNSStmx81Im3katr5TWPrNWznWvv0ekWNS6Rh2kuhHFHYaSMW1Q+UitV
 FPAadjE5mggQiovVx9Q==
X-Proofpoint-ORIG-GUID: kR_6PKZviKfal5hddRq_Ba0TgdluNVo9
X-Proofpoint-GUID: kR_6PKZviKfal5hddRq_Ba0TgdluNVo9
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a744042 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=WY3rceviPjOhuui7htgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2MSBTYWx0ZWRfX495mq5ssqvc7
 S4MTJNPCP3coP886jDwR5dVgofv72SwLD/6fx34Kge89PmK5v/ScTjT5rHg3MvWH41GwFcMyENq
 QJHfUxAuUilRIDLkDLg9RZJ6gqdSeIk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060061

On Thu, Aug 06, 2026 at 03:13:40AM +0000, WeiTing Lee (李威霆) wrote:
> 
> Thank you for reviewing the submission.
> I apologize for overlooking the WHENCE file update and the firmware version information in the previous patch.
> The firmware version is 26071602, as illustrated in the attached screenshot showing the proposed WHENCE entry.
> I also noted your comment regarding the Link tag and will ensure it is removed.
> Could you please advise if you prefer me to submit a revised patch (v2) with these corrections, or if you can amend these details directly during the merge process?
> [cid:a2116c1e-c953-4e0d-bb40-3c4bb2dab90b]

Please submit v2.

-- 
With best wishes
Dmitry
