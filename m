Return-Path: <SRS0=j+Ay=HN=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02144C982E1
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Sep 2026 04:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B742E1F00893; Mon, 21 Sep 2026 04:00:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789963222;
	b=L9YmEpftdgU8eDGsAVRoRYcc2ucwuM0RXd839j9RP2UzK41hrZVwdYDPyQ2MIt5eoAH5
	 gpT47S68jF4tKOgKP/2cp++oizDuxIKlko3eCclJuhlZg6MU+cwfvth6rmZThVVgpAM/K
	 1m05l10qcw8lKlgblfGNrXt20nYaLBX/CGNLJ7Facb42BEaFdfK5wx3sWfN6QH/Nb3Juw
	 bkw2402sPwVdsHm/lLYUg6VA0u1jC6ZCZEPBcURqM7b7B4lrjjU79eDm3bWhuXFChIQwJ
	 Hc0iJvkh7NavS2qgv27N7Tq01zxRM6qugtjRt965+uprM+dg/pk+kf3WUK+clVLd8Cw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789963222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6xSJMlr3/U1M012p6mhX6KuSQzbGBszuNVMRCb5UVhU=;
	b=wYX6hPTwNFDM1h4CER3jszQGSrQlb6Cu/oIMUEUsKCpm0ZrWdnRR3QblVMB+ch0aDfIL
	 L1KKvZE6JPNqo+Hz/HBglQeOPyyAwS1V2pE7vsuGfZAj7/5hurzU7Kkxl2yAecaazGfrh
	 UarlgoWewzryfxAMX7B2qB1lenh4W+vczuNgZcHoWTEtL2KC+DDNEsamyvpk3JmhG1qpH
	 SKFak/fvubt5twelKoDiaiEqbTnfvKAaev8GMmxVhQBfrEgshk7Kag2K0VF8Wb/XmfVa1
	 ZntLapQZuMQGovt0oJ3JMAxlmb/sLzM1kqMsX1fEwhGpitDnT12rsvwv/K5fF7RiEew==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JaW2IVRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwgbymBz;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCF191F000FF
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 04:00:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JaW2IVRx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwgbymBz
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DCF191F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z786290685
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 04:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xSJMlr3/U1M012p6mhX6KuSQzbGBszuNVMRCb5UVhU=; b=JaW2IVRx4dE2tpkY
	Od+xCLXXygj3KSSZXHXxjPsPquOCqAk4DhcQaY33gExi+MWYS32gXHJBu3/ilHBx
	W/gsQ1WMrz/zOK7arRc02BWHrYIXQnNCS0MhW4Fe8fuoZYQy6ARcutmigqRCRqYy
	dPCY9zSjjm1vtYy+2o4ZfshWGKOtK7cAJMWo5iWeVOUbr3FpCAKWxgScgKVGCHMv
	wZGZBjvRD+Du08i8i4ru3Bg0La6Rm713xMINHkgWbQZ0z1BQNNc2AC4EZH/IepS7
	xwkW86KGM4WTbaxXy4Ygvk9m1CqBlKhrbxhySShUiT8j5jqzz5Tqujx6qoKtICju
	/+hI1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfumjvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 04:00:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db22383e8fso37070015ad.1
        for <linux-firmware@kernel.org>; Sun, 20 Sep 2026 21:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789963220; x=1790568020; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xSJMlr3/U1M012p6mhX6KuSQzbGBszuNVMRCb5UVhU=;
        b=TwgbymBz5U/Uu9oCh0jzFvjT3FHS+b4IuL2ncfQvjEKyu8qIjqJimLigMrkDI2Q0EG
         SGHh91uy+ZwX52RrXu0vFHj35le0m2nwMF7UNHR4UxRBlgkA8eMG2ufNJubrsEWcZw4D
         XB4D1TGdaJmVdrCLA1M1b1poXN9aUKeqCUzqxLbMeOaRnSIHzG+wVngLCCbaaMFPV5u8
         kJOOyU0OOYUoOaa6xqDhGaBpGFAkZ2P5I87FZoGj9tae3LGRjDIyDO49pNqvfA2UhIN5
         BG2dAGIhEKIXwJH9pm82yZicZ1jmIBp1gZ3ykXOGNqYxQDegDLviZ1SGV5meDuKCfWim
         RKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789963220; x=1790568020;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xSJMlr3/U1M012p6mhX6KuSQzbGBszuNVMRCb5UVhU=;
        b=E6LEiZrj4TQ8qnXvBQ45VDhpHlfV7QOqlNooePE8ONoEgwd68YhwbC201/JG1x3/Xm
         MvpFBoInj2VcLsCe92bxNwm0w8vwlilYVco569szvOe1SvRiWp9fh9+b7iri63ksvt2d
         RQSbyXXcC7vLeKiK7uBKO1FxEGsa0cOBzfaenhgBMO0lM+q4B9WQgbpalpuZQcWYojXH
         QTtUYk+siwn5yrtW+581KNKx4yKTyLoTq/GnAEwjIB3mOqCPg5uUZm+jVM2x158JiNQC
         gDsXpF3X860uOvA4fzK2bhwPUYAV1peTSWoDluz7rr2U4GgPvxlJbpCG3X8AJZc7i0G+
         OZyQ==
X-Gm-Message-State: AFuF++k4SL91c5Yv6fuLFaplFgVQKPkfM7G3/13wSjv4rb2qVMBH4eEf
	vTzysGh4uWNq+4c9EyLsPtc/SCNL1OW6DoVaFWzIjVM6Na/3E333Lp/ZVJzHWdYAmz7sqkkaYzc
	mkfL+W/g4QayhG3x/9gFPXfjzkzuQTVzpo0UrZ/5CRRnX8zZ1JHMlxfkDD6H21aQ+1mJcat8=
X-Gm-Gg: AYBFou0atQbGcridbTfmqW3cSOD9fmndmWpjOYyUpjsOdlGijGaIvdCh2DrxkRKQgps
	5JRqInpG1yziQcwbGdHafUMf8Gcuiy31oM7YFMYwRDRgOXy0C4S9Z5UnpkRHd/VYQE4y5U+tJ02
	EGjz538fVzaY1RGAbgwy7UUCARmNrqLwaKwY051KxUWpWzVt+Ox4BL4OK61+7pyMT7T3wDEjskx
	+iVn0uul/rhV8Ay6rp8iOXU6n3RdtQbDwTkOZgQEojiy7fWABnjrqvY7hSt0HtiwQ+SAWWZo1+o
	piEkmtvRQ/bWK29M6mb0+Gs0ojscIfKfS1uXwlpfKHHRwpyXNOLbvDPai3iARexM2HTmUwDsHKU
	nF2GR2vlIBM+C3Ik53uNcbiZ05JE=
X-Received: by 2002:a17:903:11c3:b0:2dd:ad7d:72e3 with SMTP id d9443c01a7336-2ddad7d74femr112965405ad.26.1789963219502;
        Sun, 20 Sep 2026 21:00:19 -0700 (PDT)
X-Received: by 2002:a17:903:11c3:b0:2dd:ad7d:72e3 with SMTP id d9443c01a7336-2ddad7d74femr112965025ad.26.1789963218886;
        Sun, 20 Sep 2026 21:00:18 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm15141814eec.24.2026.09.20.21.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 21:00:18 -0700 (PDT)
Message-ID: <8d136b83-0248-4e76-a677-20a397cf9a89@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 09:30:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add ADSP2 firmware for nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <993dc3d9-85fa-4861-b9f8-3db807c0b3be@oss.qualcomm.com>
 <o3dwuzj2f3lgffpktrm3kw7adt6k2pkhogwwfdtvbjpc27myfp@fogpzasmcrgj>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <o3dwuzj2f3lgffpktrm3kw7adt6k2pkhogwwfdtvbjpc27myfp@fogpzasmcrgj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA1NCBTYWx0ZWRfXwtN/AMqGR8us
 ++pMsyPMJ4wh5+fk8kiZRdudhk+1Y6pJDgHLZOmEcVrhA2D66NokBNjpHRdDSoXTqY3odeH+jsU
 mlPzXlhwepI4UOMs1fONeUZrs0VUO3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA1NCBTYWx0ZWRfXxjHD0gI4coDX
 e8DQCWMpzO2V+856ocMYM3hSLRB7JaoF+y4w6wFSfhfo+wEhaCGAwf3SNdVdJgjHnawrL7uCXcY
 lwBLtM5Bc4kmEA7jXZYPoS8YApJeBa736vAuyU90YRXmsOMY3bft0NX/P0OY6V0b22BtYb8ZpvL
 s6eLIVTjVFy0UBQ1j94xgitaYum3Rov7KCfoClh0H323qtPnx9JcZE4ajBWQrT14WYuwFG/ay2B
 39xCOgtBdHa3h57bHDXjSw+tvYkiwC9GWmmNNKNXsCinxMQ0MW3GFv577yFK88ofqpWnCOuU2d9
 DAYz3QiVUSZ1QL2wEh7aWhjMh2ltZifP+6lNsW+pjKu9hUHechCXk2vjKf49lYroDofiMOjYIqy
 nHQOfeAugKjiMcxdot8K+SnlijfZsxejzPGXoDvd5hg1bRGZm5srpNRV7MfJGkMEQj0iNqXoFUf
 sLuuicFBUbMrit9eY+w==
X-Proofpoint-ORIG-GUID: CBI9ZmTZ82LEye7-gGAlMMzsNPQX1M4w
X-Proofpoint-GUID: CBI9ZmTZ82LEye7-gGAlMMzsNPQX1M4w
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6ab0abd4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qC_FGOx9AAAA:8 a=LuRUnvb8-zy3A-rcWlYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210054



On 9/1/2026 4:37 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 01, 2026 at 11:14:48AM +0530, Saddam Patan wrote:
>> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
>>
>>    Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-adspnord2
>>
>> for you to fetch changes up to c6bed7b5dc85b213bfa40e9032a42cf02595549d:
>>
>>    qcom: add ADSP2 firmware for nord platform (2026-09-01 11:11:54 +0530)
> 
>  From you commit message:
> 
> ADSP2 shares common QuRT and platform configuration with ADSP1,
> but requires instance-specific settings, including separate L2/DMT
> and HWIO configuration inputs, different TCSR SKU masks, distinct
> SRM/ETM/L2 register windows, and different physical memory pool
> bases. Reusing a single image across both DSP instances can result
> in incorrect register programming or physical memory mapping.
> 
> So, why all those settings can't go to the adsp_dtb ?
> 
There are various technology teams with in the firmware, which needs to 
make changes for this.
When NORD auto program was running Audio was supporting Audio Reach and 
Audio Weaver, they were not on board for common image support using a 
dtb due to some of their challenges.
since the other components were common for the entire image, they did 
not sign up for making a common image as they were not planning to keep 
customized changes between computelite and audio images.
For NORD on HPASS the support for Common Image was not signed up while 
for NSP it was.
As on today there are a bulk of changes that needs to go in for other 
technologies along with coretech that needs to go in since it is post CS 
on NORD, teams do not want to make a change such as this at this point
>>
>> ----------------------------------------------------------------
>> Saddam Patan (1):
>>        qcom: add ADSP2 firmware for nord platform
>>
>>   WHENCE                  |   3 +++
>>   qcom/nord/adsp2.mbn     | Bin 0 -> 3363776 bytes
>>   qcom/nord/adsp2_dtb.mbn | Bin 0 -> 40960 bytes
>>   qcom/nord/adsp2r.jsn    |  22 ++++++++++++++++++++++
>>   4 files changed, 25 insertions(+)
>>   create mode 100644 qcom/nord/adsp2.mbn
>>   create mode 100644 qcom/nord/adsp2_dtb.mbn
>>   create mode 100644 qcom/nord/adsp2r.jsn
> 

