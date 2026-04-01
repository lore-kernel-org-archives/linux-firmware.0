Return-Path: <SRS0=07bA=CA=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2431076370
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Apr 2026 05:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A494C19423; Wed,  1 Apr 2026 05:39:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4341DC4CEF7
	for <linux-firmware@kernel.org>; Wed,  1 Apr 2026 05:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4341DC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312EeSJ3081373
	for <linux-firmware@kernel.org>; Wed, 1 Apr 2026 05:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnnfbAiiPeVGtrG4FZt5Hca10UcCWOFbpe/4hMW1cPg=; b=a/+fzMtQLMHirM4+
	yH4VqQ3ukcQhD15gwFvQN4Geq4GLgPpOTG+gSOn+PwoFXflkjjrSfVojTXAaJTjA
	MunOk7euW4H/UQx+/od9VYo1/yk8iYw0Lh+uslsV7YllPfKU23/y0briTwPUdNb0
	x6QcV2fTDUHG+ByWIif9cz9HC8PQIbS7VuSr8Hn+WAqOLIweLXR4/2kGTeQUJWYC
	eJpr/ZjG9aDQdnPd3kaSM04Hz3T5DXMz90Ca0JkGWmQEBC1gP/wVfL7FUQE8nCTo
	uEZl6b1FsmfJ29wQVyMRike+fgp15tLylytKb7qjFf2qX7CLg3JdXswNEFhOBARQ
	IQSdSg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdktdeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Apr 2026 05:39:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso3882638a91.0
        for <linux-firmware@kernel.org>; Tue, 31 Mar 2026 22:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775021982; x=1775626782; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XnnfbAiiPeVGtrG4FZt5Hca10UcCWOFbpe/4hMW1cPg=;
        b=VTQz5Pf2DSok/q9z5JwFYqFZPRysHBE6ifUy56gHho2PY23A2qP27xyf7+TC3hn2qK
         PZo7YPiXXF+rCal0Xx7ZuzMg2G+OoWFLz9DXR7wVjeQp067C10rSsHjhvOSkmtkkfFNR
         v4DYVIZwNAAxUFqJtMNgT/aQsXv5dCV19jOfBaTqu7mkJWTR1/sFLFW3VwJqrbmKd/QW
         jaVNDZJAiukmErJ/IXjOhVFI/tQfsi07Ni8X+pMhuTNeh9La3QC+oFHgfpnU8sX6eEAg
         kNm1olB1WNnIoH4mzA5qkedsXWvhl4qWn/7PNwDClQKbydcsUvZbhCVFRANVnLr7uPdO
         j8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775021982; x=1775626782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnnfbAiiPeVGtrG4FZt5Hca10UcCWOFbpe/4hMW1cPg=;
        b=hUQPTXD9ZZW8sDkjmHzHA0MUXgSAWKLHUEnNaG34hi/2FwIcPJ63I5stleqI1txBm1
         9cEUzY+s12P8Ugi085ZMVe6pjoYpB8hBhbCrNeCsQkHhKeOnlBDTKh2IZsQlX634B+tA
         6JMNVY597WFrri8TjAoG5d8XBmLcAViPbRI4SYSbP6bz5BInbZaQ9m28tmYdNR0TESpQ
         hr/alKfvYuhIZms6bn2QgeGHI+WqOssTMnOC5hhfj84Gw5yum7Fv22jbIoSr8vx3KfCt
         SLlW7s6tLCxI65bH30SvqNkhols7Q19QIscYweTx7KqfHSHwo2omMSMIexUZj0FGpmg6
         x7ZA==
X-Gm-Message-State: AOJu0YwBCuXAiAM1tikfRc7oSIuWjajg60mm3FD0b6rz/cPmvXn8f+Zn
	WrwkbXehOuAEAyNB62iEZgLfoKZ1rJv00TxvXIs+/xyTKpGCJvMjPAXxC1+CcmyOmBgJg/L/gUK
	7r+adJQNaySx1AQiVaDzQ5XBobde+BN30RWLDbKsmhtZ5dk+SrDQp0zjZN0lIXNk=
X-Gm-Gg: ATEYQzxSRpzZ01swncV0NYqSaXWGmVHoxfZXFzKOwqZMN+1B7fuNuMRZOFBs4dI15G/
	b3BFkXzpTSN3d00HXTotXL48x8LNv8QNHZedrCkfU6+Wqmi6m5XjaeZJ1vdQh698nnTSwGknv7e
	CD3niAocjOLhqYNPt7mCpGaJwymrikx2j7nLcgLB5ldyOWQUsYduPbdA4UKQFXuSNwAhEw2U5y1
	y5/tvpvwfd+TQJb/qZzgv7dXuqzfDPtPqXtkekED/2ARMu6yZ8mfG4AT1MyjxzsqSmOfXyYlmSu
	HrCzNl06Agz1aDLmTMcKGDicToGrSTCY8AKFh0VHhWaBYlaqKqztEoOJG4nLK8xSxo9eXFqALrz
	2SYV9XLVzXSy16LknDWLMgqMLkJKx6LHg+6b0pB8=
X-Received: by 2002:a17:90b:3e4f:b0:359:fdc0:4621 with SMTP id 98e67ed59e1d1-35dc6e9b097mr2246633a91.11.1775021982429;
        Tue, 31 Mar 2026 22:39:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4f:b0:359:fdc0:4621 with SMTP id 98e67ed59e1d1-35dc6e9b097mr2246607a91.11.1775021981984;
        Tue, 31 Mar 2026 22:39:41 -0700 (PDT)
Received: from [10.216.27.220] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbb840a36sm1742181a91.4.2026.03.31.22.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 22:39:41 -0700 (PDT)
Message-ID: <0cd00caa-a626-4d77-96f4-232db9e5fef0@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:09:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update ADSP firmware for sm8750 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com
References: <e115ca3c-33eb-41a5-95fb-42d5767d474e@oss.qualcomm.com>
 <cgn3jvjyutddglx46kvckd6frqkxvlnx3i6qrtzyr2jggqhuk7@tnfevwujk2zn>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <cgn3jvjyutddglx46kvckd6frqkxvlnx3i6qrtzyr2jggqhuk7@tnfevwujk2zn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA0NiBTYWx0ZWRfX2fHYHXIlotkH
 rqaiLn2ZSNjlm9AqbnHI7z7IaSb3KVGX7DwoTKjujfEpvy3eLS1v7b686QatFZ5mYW0S7OU8f2Y
 uLGfKWF+bBm4HeSag6Z+InlA9oFFWj2HQaqLOZ8fUu4EE8o8VXZAfQ/M303nOlndy6LVXhSS8IK
 ABiK83KAZwJNMgDmkUKJ6m6OwFzhbDM1+wQwxJ96+sXpIg9K7o25+k5mZoMEgqErk3Z4Ao12uw0
 mD2vo0urKqoYrFgUI2ynDbthk4Zgy8xYJukA3AR6piixUJ082kENcht0t6W8O5z220XIvQZS+4+
 D5IBDahwoXiPWKtIrsnG9tzfE1PDV5P6UI9kcyUyYE4XQfgnbw+IGi9Qjzn88FfarVxZPnsGEJU
 Q/l5eGd2k1H0f4uX3NpV4XuQBC25JLUHcJiJYXT2QjyDHpUJB6vsg2hIyskva6PqCqGksxTPe1/
 2v6QidzGhN4BkQn4efw==
X-Proofpoint-GUID: B_tH-KVWlyYWb8LslL3ejOOhw7_lL_PN
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccaf9f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qC_FGOx9AAAA:8 a=V6OVj8RJtZOMGejoQt8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: B_tH-KVWlyYWb8LslL3ejOOhw7_lL_PN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010046



On 3/31/2026 8:19 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 31, 2026 at 12:17:21PM +0530, Saddam Patan wrote:
>>
>> The following changes since commit 85786b4413fdc486e3bc0f4f6cfedce7802ed041:
>>
>>    Merge branch 'amd-staging' into 'main' (2026-03-27 17:22:24 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-pakala_adsp_18
>>
>> for you to fetch changes up to 47fcef3409cea1043a33ae74ba1a98e55877eb09:
>>
>>    qcom: update ADSP firmware for sm8750 platform (2026-03-31 12:12:45 +0530)
>>
>> ----------------------------------------------------------------
>> Saddam Patan (1):
>>        qcom: update ADSP firmware for sm8750 platform
> 
> Why is the new version lower than the older one?
> 
> -Version: LPAIDSP.HT.1.2.c1-00450-PAKALA-2
> +Version: LPAIDSP.HT.1.1.c3-00018-PAKALA-3

Internally, LPAIDSP Image team has created this branch to support all 
QLI and Upstream on Pakala.
The earlier branch 1.2.c1 was being shared with other SPs and we cut 
this branch to restrict code churn accordingly.
As far as 1.1.c3 is concerned we aligned with the original main branch
> 
>>
>>   WHENCE                   |   2 +-
>>   qcom/sm8750/adsp.mbn     | Bin 19413384 -> 17639864 bytes
>>   qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 167736 bytes
>>   3 files changed, 1 insertion(+), 1 deletion(-)
> 

