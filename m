Return-Path: <SRS0=JeQv=HB=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB4AC79F8C
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Sep 2026 09:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01EF41F00A3D; Wed,  9 Sep 2026 09:12:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788945155;
	b=X5aNCj4uw5RJiW4PYgElolgyulV8PYpFe2/luvDaUDyBW3DEzh5kxxMChfDuQL3HVF14
	 gz4Q3+dBmMawIX6OYmWUOeXUsRS3347BW7ocAuX/NYpAdvBgTUxdcj0vqUHQl8C+kiLx4
	 qCkB1sWWWNeEmjXjcmInyq34JWAWgrc5F0cjo/hOtkNag0V9bzmUIxrRnfuaoqoHFZ2+T
	 XJrAoC9yXR09qCypNC5IwUPT7z2anLSicdlwi0d4CBEdYg98wrjA89ZAsvUkUChOfVyUa
	 9M3dPqMUPJl2RerOaHClwP15TjGsfGFPBy02bVFxcV7FZGSanIQh6m/ml698o/9/BEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788945155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WjouUBB4ux3FTZ9IK4FPZ6dBGJjxgQ+r07ejHqTAKh4=;
	b=JW6EVIFU5SmSKiXuyjz6+INM8NsEqiLcQwe4FNJt8nZOWHM/S9D7DIywd+wb6Sv4cG3D
	 U5NxuykxdBIyCsbq2fSOCPDzbBKBvx/ro33dtwpVaXVlmrnJsacSPN4JFkRolwNSETCgT
	 gpIIQ8r58K85W0YuW5NqUf/ruWVbXNG/ohMT1e1mSSSek6A3aPTVywY1N4s681kY+QEHg
	 xp92j1JdeEx0D709+DBWZTdqtO2x3LE4DWdhX+6qXRPtqtAZc+7Djo/71smZsPF5wYPtS
	 sLziMIb9juHsgryr+KjkaUCGxr5nPrs3ECvO5kVBbI4q97SIaRUdmvId8aZTYAfJ++A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fvZ9eJKj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj4j9vB0;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E8481F00A3A
	for <linux-firmware@kernel.org>; Wed,  9 Sep 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fvZ9eJKj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj4j9vB0
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5E8481F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896gXP7964984
	for <linux-firmware@kernel.org>; Wed, 9 Sep 2026 09:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WjouUBB4ux3FTZ9IK4FPZ6dBGJjxgQ+r07ejHqTAKh4=; b=fvZ9eJKji6ao9HUH
	oEOVK/E32SFLJfXo+erg3uEGO9FEtOZPhYipIiyDxYxP498AkAhvzKDQgk4U/4+7
	K8I3cPhPMqv1yOfkh7+VvsA0VBg1NHsScPcXMQrJTCv2/aP2o0UZjwO+vzn1jBgk
	lbx/Q1isG38NV+7ip8P37mk/bR550uF6tsKK3Dp57RhCFABEf085e7Ow+iBo2nNH
	DPwpl3j5tXKuTFaLRrQXUusQ5SK0QuVWVSjIYQ10E/v4EhVu/v9Cnagf8RRHnqlT
	ERJvzuMO3ciWKetTigM270Xv9vad6NIJf/obvbCcRNY42FQoGoXWE+2XmhAdrKfE
	eUTGBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha38p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 09:12:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so996328a91.3
        for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 02:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945154; x=1789549954; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WjouUBB4ux3FTZ9IK4FPZ6dBGJjxgQ+r07ejHqTAKh4=;
        b=fj4j9vB0/YrMOcSLXFeEuft94uEptXgJgn0CYfix3wgAimjPqeohhpsB+uewO4B4fr
         j4jovwPMPP53LWAv81b5TqQEs3aOaRMz/5YS7MrEupwtuaWHSRgup0bOhKua1Ejm7lcd
         IOwJAxLCWzBaNwdhIzFJYwQBVzNAS0PpUTZnWOyUvi6HOO3Z6dA09Ju5mWKiO3NILi5q
         0uaHjt4c91fy+Zi5iCvkIURZnPd6h/aCDnUY1sQJdUpDd66fDy/gHk7i0BI66bdrGsNo
         ZAhrx47PJSCNKaNtKlY2wgiezK5CVHLPwdmWT3WijrDLVn271Upt9Qo0UNP+mPbsqilp
         cscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945154; x=1789549954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjouUBB4ux3FTZ9IK4FPZ6dBGJjxgQ+r07ejHqTAKh4=;
        b=deU6hwq88ZDLPwALVadqxxnUyKg60P8xbVndAnY/dbnz61oR63FnObfUet+85mRDGt
         VpmZiHYo8M7uNL4JntV0OSU8o9FZV+IK4d92FogUaksfG2r9//CJOePQ0eeYxaNy1vSp
         g/l9OBZWkoOTDf0cPW9f3I46MJLpaco00kiUaGKzJahOquk9qsacCTUyt/gnEHnLeDX4
         v/XYxPxFFkNE61rWjD7yjm5QJNS6sMhaa+fydnbB7p/iKdvZS7bdcSeCOvBuzocgvSt2
         CD5bOqbUs80RYCmltm8Pd8Ydj8bkbKQPnqeY0fcQ6BfNWOd6s6jBQW9Swm3Ma4tWHTR4
         H0BA==
X-Gm-Message-State: AFuF++k7033EcsK8urrrc1sn6rtQvutgggqHoGhZybn89zXoSkQmLfhs
	5Fjos8mNVbXIaig+RwB1L8VLKuwUAHoujJLPQnq8UR3u0MF29UwNdLb+C+82nyhDKZwa6fNbiJ3
	bgtDLnpj2BMYXErstX8gwt7IcnmNMyRaiN9+dDOe5mw1JB+NZy3/MS1ASE8XAVE0=
X-Gm-Gg: AYBFou3sRp/S7/vSwsnuDUNDk7G1Nh9R+ewgHGIqIqCF1B7b7RB9zpHil4Lg1hS+Pwn
	SOakDP96+ojmI1I3v28LKb2ekJWl8JUWLKNzo0faEQt1I6lJgiMdhlWpgC80h/S4VGKHbiyNiuZ
	f0p3U4LvjdFZJ/UM4EaVdfd2vMXP4DVkuFBAF+CkmGE6i7qZI+7PNMiikvs8vrn8AizjCq5Uj+o
	EuhZ7jN6yzCStAuPDSDwWjclNx+pFKAAAE3FQfdOBg7ETJzxRflNn4pHYjZ1w5rQzWaxiaCheRO
	jrzg7VrWAYYvh8KF44wtA5E4sZN/9+Gt/YsvVyxSxXw0BPB77ObqPOBNit6CQRA2vJVyqJVNNeo
	xzFgIfQxobZR029gMDiJCFPDoTXEg6Q==
X-Received: by 2002:a17:90b:56cf:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39b262aa580mr52750797a91.17.1788945153503;
        Wed, 09 Sep 2026 02:12:33 -0700 (PDT)
X-Received: by 2002:a17:90b:56cf:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39b262aa580mr52750755a91.17.1788945152998;
        Wed, 09 Sep 2026 02:12:32 -0700 (PDT)
Received: from [10.219.57.219] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm46385298eec.24.2026.09.09.02.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:12:32 -0700 (PDT)
Message-ID: <d0830be7-9e4b-4a51-916a-b9edaa1557e9@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:42:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
References: <2884febf-ab38-400f-8f37-38cf3b0c801a@oss.qualcomm.com>
 <akct7mefomhu64zl2iasuap6dcu43sicbni5cfoas7ih77zyow@iqnpzf3qcnyx>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <akct7mefomhu64zl2iasuap6dcu43sicbni5cfoas7ih77zyow@iqnpzf3qcnyx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMiBTYWx0ZWRfX3+Q9kxSkRTlr
 hWrIPMvwB3Hz8IhCG/BtY9d5dfxT2V3n5M5xaBmLLB8eRiM5DVwfPBnBCriBTM1nwzXsUDBH5I3
 zXSC6OjG62V4c7k0N8r3M+X/qu+70nsS2LAW2ohNLj2O7dK+kPdkGL4v6w5CneOmeNpxK1NmU3Z
 FahBE+iDhM67SYC7nAJD8EdMuNqOzAQnBPkj8E6Eh8dd0y1a73YY2itsq3zbAjwoFCCh68fOMCD
 hu6IW4SWv3DGJ8dKWHn140Ql9H4k8l9FL0N1BClQc4cNqyNY87mSrwicK32sUdK7WOgfblSepRQ
 G7az0RlrhmowZbHOy7QUos0yAzCOK5mr86W5iF19zR3FZb/HajBDCYFd2KFQwFbyKdSU/ZA1Rch
 WXA17Po7pjtlMTaLCnP1u6jU4VH6+lniQqzoQTndh1Td9QpJ8WudjN880NN3dHHYeJ1WconvvX0
 Uhr8JfsOqmoYJclgO2g==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa12302 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=8usKRSHB1syKmP7mjGQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: ndhqYy3Ywny5kqnUhaFK0d21An1I4sAl
X-Proofpoint-ORIG-GUID: ndhqYy3Ywny5kqnUhaFK0d21An1I4sAl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMiBTYWx0ZWRfXzogV8gjtwU2J
 XlhpwM32kWje1zM67X45jyyK08YEIe62mJgVyR9FqMQJOVZkPyO6jQCgnxtEL2DwfiR/Qe8yDKs
 J5jVhVWtjupRdBrn+sTF8886dDJvlwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090102



On 9/3/2026 5:27 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 03, 2026 at 04:16:53PM +0530, Saddam Patan wrote:
>> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
>>
>>    Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-lemansdsp205
>>
>> for you to fetch changes up to c620d583926156dedd51d9ce636e9ba06297ddfc:
>>
>>    qcom: Update DSP firmware for sa8775p platform (2026-09-03 16:01:52 +0530)
> 
> If the only change is '    1.Enable Sound Voice Activation support on
> sa8775p platform.', which sounds like audio DSP only, why are you
> updating all firmware images?
> 
Agreed. Since the change is specific to Sound Voice Activation support, 
I've updated only the ADSP firmware and submitted it in a separate PR.
