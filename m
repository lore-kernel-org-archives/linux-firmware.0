Return-Path: <SRS0=DzPH=4M=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9CFCCA470
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Oct 2025 06:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12A96C4CEF9; Fri,  3 Oct 2025 06:55:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5938C4CEF5
	for <linux-firmware@kernel.org>; Fri,  3 Oct 2025 06:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5938C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592KxHf2012858
	for <linux-firmware@kernel.org>; Fri, 3 Oct 2025 06:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8/PYzv+BCbanV6RVLqbGGgvIl29FFYewCCjoz2Eroc=; b=cAyG4zAUqR5zuEvV
	O64+SsPPtiBsJYd8Ki/s/Orn6vI8GHHh+6aqWmnhiKO0LGmvdiNyptvA16yHilQG
	gkfW8n1bzqYxVSOrtMQLyQWeYanCht+iHXfrb/rayYM3jWKr06159p2KUgC0Qbjp
	AcJ45LjlCgwLeRBImmfYmt2SOlJuN0DS/o86TKoA6J6YVFoFmjyxojnOnxlK4hTf
	9ND5mE7TAhb3fxfH23VFgwkQCj8a2aFOmVdLev+9Q5nMvWScDCv0vxifqQY+L33r
	muJ9iQ7fNkqH0IzgqZQbk+Qjahx0L2o/qylY8JF0Ail0tJJzAaCQzUh6Yf4vEZyj
	ZCc5mA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u27e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 06:55:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3352a336ee1so3658685a91.0
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 23:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759474503; x=1760079303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8/PYzv+BCbanV6RVLqbGGgvIl29FFYewCCjoz2Eroc=;
        b=C2biXMifjMIL3tJzQWJfszysXZCxJ/rZa0T/O/xnD/reNk9GJLdOl+KV7ExdOOaVq1
         lUfDKJQWha4uFIhCQS+HamjRtr/3vDDJ+FNYdkV0PhfKYC2Fhou62zHRzYro5oDeucZQ
         G5CVl3im817pV5Z/o3b0iGrFif4awXpl+Ea0YhmyD7enS1kR1yu8U/wRNId9uJA5TQm+
         WyGy6H4dsWkL1fuOv196a2jN6LVU9QFUmPlQ1G8QepVDXJGVMDRjAzLwj7gIEnpK3sfp
         Aw6QJ/P5+FYzHY1M+7cZhucBmaBqBj/3UfZBHDOM2QECaD56QGOuYfkLnPU06iwLGvmW
         Ep0A==
X-Gm-Message-State: AOJu0YzTrNX7L19Kp3jjbMiMG2Ts6dixH0g8V9xozsC6qS7hakTY9IHn
	+U0KWz92CN9thOvfqZSU9jI1mcTwS4wGk3nI9fRtcXpuUN9kE4wPGkiFP9TSa4ONk17vDreY7Yh
	bTy7Nw1HtfDtR4bAWLv1rFBPjk04JXVuJHBlAZ4ymfQcbaADc/X1DC7Pa1186hZ6m6bMm6dM=
X-Gm-Gg: ASbGncs60VlCeRla6jPOAza4genjQHlRl3ZKnje6YE5J56JOhlNK8C+lGbbasmV1cbD
	tucT83C4AA262gimFUi6rldIWEh+awSaUFY00IChsX7K0jL6qza6ImIABAOdgXk3d0a6DGSmlyp
	QRqgx2epD8PXxKyKz9y4yyD+hvgQ1mYZ+fKuDRebJHFFV06eKYBK9MuDvS7Gf4pcWiLrXFWw9S9
	ZQXOVuAgDVhX2C9RHPeQN305hCh0+KBnXdFBAOA8aDif3MaUX/10XeIVWzttnt44BAxpNN3xryB
	KTws4jPE0C08xsT2kmY5rQScMaqNFZsbLaM08iQ4cKd04b8LvvWIXNdDtLEalNDXOk8lACM46ic
	cKw0=
X-Received: by 2002:a17:90b:1f89:b0:32e:d600:4fe9 with SMTP id 98e67ed59e1d1-339c2724b61mr2378453a91.4.1759474503213;
        Thu, 02 Oct 2025 23:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyglpow/jRYNh2DJyp+9wAZdHQD13zlGnMZupsetz79L5LAJ2G5oXXwMBnq0OU8gM9ehBqXA==
X-Received: by 2002:a17:90b:1f89:b0:32e:d600:4fe9 with SMTP id 98e67ed59e1d1-339c2724b61mr2378427a91.4.1759474502733;
        Thu, 02 Oct 2025 23:55:02 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6e9d2d4sm7196016a91.2.2025.10.02.23.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 23:55:02 -0700 (PDT)
Message-ID: <0c9f7619-acf1-3927-0caa-00ce9f696129@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 12:24:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: add video firmware for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <bbd5acf0-e985-1f55-052d-8d3ecf0aa910@oss.qualcomm.com>
 <e2wyi33p42lsq5f6ihuw54k5q6czbt2en5ocijswypjgw52dbg@wz6x2fojxvoa>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <e2wyi33p42lsq5f6ihuw54k5q6czbt2en5ocijswypjgw52dbg@wz6x2fojxvoa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX5VjohA//HEpf
 YTesRLUtos+8obPa8SNCo8I60P+CBfzqi1dhCBl15kRvnSqZc4uLe8oWX1SGNkcbrAKoYScp+BU
 gxVnvPiNlgDwcRLP3YaWnK+A8FCxTRwmuFa4KBNl1x54fhpZt9AkwtKfY1yA4jmqCn96JUHr5Kn
 GMBvNC+GadbBIka9Grev+Yf8Mdy6RLaNptgK1uHN8oG+UTBiM0ifHK7ISjt7HxQmJOLlVnj12bf
 4MLyz0gAXXGIKzfWPVphy15ty/loMT19h3KGXLChF2rXneqc2gGA6e6P7WsJROCNRDbxi7IFl/q
 roxptMeLYNpkuMD7WygdIlR9YCASJLmVWgnhaylgY3421UZVkalpGCAVJXJWt3Nsvas1iwkDJRS
 ytmV/QgYa1nMSIbG6MZTL/qAq14jpg==
X-Proofpoint-GUID: a7wVOm1Ndckloi-KQlNu_Ph7MA5mbo9n
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68df7348 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=FgcnViFJEAKiTKWZGXYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: a7wVOm1Ndckloi-KQlNu_Ph7MA5mbo9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029



On 10/2/2025 6:18 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 01, 2025 at 06:36:11PM +0530, Dikshita Agarwal wrote:
>> Hi,
>>
>> The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e83e5a:
>>
>>   Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> video-fw-kaanapali
>>
>> for you to fetch changes up to 7c2d4d41e96fdddfa360c0740e8a8ee9b5efb572:
>>
>>   qcom: vpu: add video firmware for Kaanapali (2025-10-01 18:32:02 +0530)
> 
> +Link: qcom/vpu/vpu40_p2.mbn -> vpu40_p2_s7.mbn
> 
> Can we please drop that link? FWIW the driver for that platform is not
> yet merged.

My intention was to keep the naming consistent in driver with other
platforms which are using _s7 firmwares but driver still won't have this
suffix.

eg: when I upload the patch to rename let's kailua firmware binary name
with adding _s7 suffix, driver would still have the name without the suffix
and soft link will take care of mapping

Any concern here?

Thanks,
Dikshita
> 
>>
>> ----------------------------------------------------------------
>> Dikshita Agarwal (1):
>>       qcom: vpu: add video firmware for Kaanapali
>>
>>  WHENCE                   |   5 +++++
>>  qcom/vpu/vpu40_p2_s7.mbn | Bin 0 -> 2474696 bytes
>>  2 files changed, 5 insertions(+)
>>  create mode 100644 qcom/vpu/vpu40_p2_s7.mbn
>>
>> Thanks,
>> Dikshita
> 
