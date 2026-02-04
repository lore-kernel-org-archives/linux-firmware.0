Return-Path: <SRS0=P3Y1=AI=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA46E8B39A
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Feb 2026 05:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89D44C116C6; Wed,  4 Feb 2026 05:10:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD2BAC4CEF7
	for <linux-firmware@kernel.org>; Wed,  4 Feb 2026 05:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD2BAC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6144gmqu2732670
	for <linux-firmware@kernel.org>; Wed, 4 Feb 2026 05:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLyzNIsPy0GuCVLIiyn2jmWWKFKrrO2DCI/P2cUNn+E=; b=l99AgsIu8vEFYyko
	IDTN+LM6YwhfuQ+tbGvUxFtANFVOhgYSaDpXxZD9xw9orIvlMOgULX4GPYc7/1hx
	PRR5ELOQEZLPbzPS4dG360dTcsIc/RxAIR43i7utZ4dYkERBY0JW3TyIaLms9Ibj
	XyAkmR3oUOXokbBQK2DT6EleKe4/NOnx4Xo3VqAs6gduYHIleM7ch09glRz9Ixgh
	mXp8esSKuIkQUhL3w7XnYhU2doKgM33QEbRVrznxyJPgTmMaPqxnP6rq86kV0znq
	rJ7RZh6yCGQykQH3Lruv1x+i7TeRX935bc2Fzw2VpuPtkegtKqKhOzlciZnecgKX
	7VVPoA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exjkc07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Feb 2026 05:10:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12339eea50bso26927911c88.1
        for <linux-firmware@kernel.org>; Tue, 03 Feb 2026 21:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770181839; x=1770786639; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLyzNIsPy0GuCVLIiyn2jmWWKFKrrO2DCI/P2cUNn+E=;
        b=DRo7NcDPEHSIRVlPzQ6q0q5vTRf9xqj5vIHodlUtnm5yGtIx7IFT+5kX839SrvtQMw
         0R9iVgoY5CIOnpdKzzmbRsTKrdAjOCHXBQbHMzN68EvAtz97y5mhb38Ib2FfZrsZl0Zo
         WlpMPyCyhdw6yNewJcHumP4KyET9Gea0IVCYURXzeKfO/RVgAceMcl9HmE89KQnOdNpb
         wWpzLXJ85mKd6+9/XEj28+LA6PNwaErTQDPyh/a22jZ5LLUUlgcO/D6MP+chlKnkdZm9
         sXymJJwqobzHtGksplXaxNTQZ0jW+yRU02rLbaaU+2uACgBb5e1IacpRTjX5NcZQLI9M
         +NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770181839; x=1770786639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLyzNIsPy0GuCVLIiyn2jmWWKFKrrO2DCI/P2cUNn+E=;
        b=unYUg4wLMaVcqUxCvHwzWKBQapv10PU1EYl9NIhxGVgBtLvfMMU6oyXrU9J+XiiVXs
         UHmYTjBhpPRz0erL6hHQXnrsPVTScv0nWDhShCwP2qrKs/MSpNBdFb0xubJ5V2FiEDXB
         MPsROYLimSujUCJpWCTiB86OZOirO9eXYw/CsjfHgud7OcU93Px8nsSJ3ST0Sme7g9EK
         hi/bcwmW7CgVn+uaB0Md05VGA+eAiAJ4WBFpCqYyEGccIjPLpMVgBkH62FSeBgcHPilS
         ciAUV4nTW+kjJOxP3YnTnH4Y/jzvx9iNS0BKQjSsFYJ4Rmej9rxunTdPx+wxnBhPtgYp
         GXrw==
X-Gm-Message-State: AOJu0Yw+yRPs/rKOwThNUsybj7cd+/vdLdQyQoPVT7upSfja35/tin7H
	/ZJpmo8rRilQq1p3PGZ7Iey6oHnXH2hUB5zqUyh7m/niJozfJXFPE8xRUVh9kp9ix4B/4sFwjwG
	a+J1s0/upf/iJ9d8qEK1OpiMFMrArg6cMot/QfKpZ1RvbvQsgHh9WcJFpQbLKw3M=
X-Gm-Gg: AZuq6aJLAvuftserMaQbb5uV+uQNCqlYDvSzFimwQqKVHmEu2MWbmlhJvfdO+8QB1nz
	xECvAqPX6AGqysh0TEdVyCw8AjQdhPFInJpymL/sIV0QSzxgy2jXa8MyyTa529OBuMYpYP48AYC
	Fa7Kwk0faVEn+z5j7oCmJna4y0p9EDRfigmOx9GJsllsuBsQRVhw65oDdHfZj6s9uDSdqLVav/B
	ChcKy/UF3oVhDFBN1r0AuwHLeHhAufTLnxpd35E905NxZk6Y2mkheuUfvDrgAFq9lZVkK+CB+17
	a+gZHP0ze7IoDq5XGLp9oqj1EhKg0VD1QedaPTwrL5IETcNAKxvDIOrZzupabJZZOyOvNodiQ47
	/U8dLkO8Uax3ZzcnA8ojCl7+1hgwewBCOJzBBYodw
X-Received: by 2002:a05:7022:207:b0:11d:f440:b758 with SMTP id a92af1059eb24-126f47c4656mr942922c88.25.1770181839022;
        Tue, 03 Feb 2026 21:10:39 -0800 (PST)
X-Received: by 2002:a05:7022:207:b0:11d:f440:b758 with SMTP id a92af1059eb24-126f47c4656mr942908c88.25.1770181838478;
        Tue, 03 Feb 2026 21:10:38 -0800 (PST)
Received: from [10.206.100.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e04467sm1006171c88.2.2026.02.03.21.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:10:38 -0800 (PST)
Message-ID: <ebd912f7-d91b-4d54-8c25-ad49b552f973@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:40:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Add ADSP firmware for glymur platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
References: <01d9e305-f4a0-42b7-ba22-5a9907577b8a@oss.qualcomm.com>
 <5b58bccf-ffa1-488b-bf6b-28e19b5fd5d4@oss.qualcomm.com>
 <c097dd43-f1ac-4e7e-b4ab-1a6f74193758@oss.qualcomm.com>
 <qfsg6ibhsuivlbhjk32vbafj6eablll4p7kf53khka6hldj6eb@aosmofo5vt3s>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <qfsg6ibhsuivlbhjk32vbafj6eablll4p7kf53khka6hldj6eb@aosmofo5vt3s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W8c1lBWk c=1 sm=1 tr=0 ts=6982d4cf cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=b6x_iSdxvGBHc2bsSj0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: t7aEC-_dP35Fgpao07WD6iE3oI-mzDpz
X-Proofpoint-ORIG-GUID: t7aEC-_dP35Fgpao07WD6iE3oI-mzDpz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzNCBTYWx0ZWRfX1OjdTcziZiSg
 lXxHb9xzcbPH6w2iX5qCVpriIWuMHHswiucC0anbYMmnSNmaY4uZmQ7RcJ9NUOIV/yHtTxxe5Nc
 t7UOg+r858/t98uCdRNGgJG5jpZtAyTn8WCtgxnVz1JmUmYAjSEc6vSxZxSwfJk0fBiw3IHX6bH
 zrXMPDT0a8XscgFSqgkvewDhtaEcjG8au8Y11xklzQCpNS93QAfKVAhMaLEBwbGiUBIDGSBLED8
 O/2dbu1ItfUahTUpn1t8jg9YiV+6rFmE9tA5SE9yR8mS9ONZ0yT7faEPrVT3KCbY/oXezIEG54n
 RDmaO4OnQdNmzn0KqdqN1gLLAxaPB1eNeAIu4v5XE8NRsbMJjgPs7ke9K3P7/htVajVsFayryQy
 4vh2fGK0O32PyCZRuMt/3DpZI+RX98Ei079pgjwCQsIOohvDhOOXymBvYehKeDBnc8k3meZmTE3
 GTEkKFXuR7hHRDTwNeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040034

Hi @Dmitry Baryshkov,

The CDSP build is now ready as well, and I will be pushing both ADSP and 
CDSP firmware in a single patch. Please disregard this patch, as a new 
patch will be sent in a separate email.

On 2/3/2026 6:10 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 03, 2026 at 11:11:07AM +0530, Saddam Patan wrote:
>> Hi,
>>
>> Internal testing for below patch is completed. Please help review below
>> patch.
> 
> Let's keep the entries at least a bit sorted. Please put Glymur firmware
> before Kaanapali.
> 
>>
>> Thanks,
>> Saddam.
>>
>> On 1/29/2026 3:49 PM, Saddam Patan wrote:
>>> HI ,
>>>
>>> Please ignore this patch as internal testing is still pending and we
>>> will update a new patch post validation.
>>>
>>>
>>> Thanks,
>>> Saddam.
>>>
>>> On 1/29/2026 12:23 PM, Saddam Patan wrote:
>>>> The following changes since commit
>>>> 0882248d05045565bfefe1f07cbfc22276c9f058:
>>>>
>>>>     Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23
>>>> 19:26:31 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> dsp- fw-glymur2
>>>>
>>>> for you to fetch changes up to 6b573904745830699030541b01003e6fd1ca294b:
>>>>
>>>>     qcom: add ADSP firmware for glymur platform (2026-01-29 12:15:54
>>>> +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Saddam Patan (1):
>>>>         qcom: add ADSP firmware for glymur platform
>>>>
>>>>    WHENCE                   |   6 ++++++
>>>>    qcom/glymur/adsp.mbn     | Bin 0 -> 18622472 bytes
>>>>    qcom/glymur/adsp_dtb.mbn | Bin 0 -> 7253 bytes
>>>>    qcom/glymur/adspr.jsn    |  22 ++++++++++++++++++++++
>>>>    qcom/glymur/adsps.jsn    |  22 ++++++++++++++++++++++
>>>>    qcom/glymur/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>>>>    6 files changed, 79 insertions(+)
>>>>    create mode 100644 qcom/glymur/adsp.mbn
>>>>    create mode 100644 qcom/glymur/adsp_dtb.mbn
>>>>    create mode 100644 qcom/glymur/adspr.jsn
>>>>    create mode 100644 qcom/glymur/adsps.jsn
>>>>    create mode 100644 qcom/glymur/adspua.jsn
>>>
>>
> 

