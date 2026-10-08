Return-Path: <SRS0=fwGh=H6=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9C6CA600A
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Oct 2026 08:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 989771F00893; Thu,  8 Oct 2026 08:40:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791448843;
	b=mcVOX2ymHTzV5xA+JU1a4UdElbto7qnaCFZGfFUr2YwaSCWf9jSApUekcc4GZ9dGHDne
	 4uAFqaFpbdK7Lfj0SDFui4IpsVgorjqU/uZCAWiXILziUM/zkGNpsWTF/JXuOvCgu2Bv3
	 j1aMtW6VzDPp62ZTtEkD88Zj/UyjNBHhhEqGtIWng0NsvAm+jDhCRjYJ7z5VrvuDkpQJJ
	 aAvtQd0tVHYfuNnrPQ6H0jnHO5eddhdmS5wHMukHzxOXJEA1COwPc1szDHGix6lJNNJwb
	 qP7LAdteOL3ebEfvFX2vBMCqKjXSUTaekIdQ1ODZmvsrXVSs3aAQSc/stzJ+qW/DjqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791448843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z2mxOeX9xcwRyHJZ/Ra9L3ujmJyOKtt9sy87E3e7IY4=;
	b=puL13J8GDcU5Z1QREPtXkKMIA5Ds/QOLWgn99w78NI1mDpHZFvfxvtlbEV3ItpLNVwxc
	 K0nfILF2cWMhyoDLXvHZe94rCxz8E1DOjuyWlcKKUdIFDsdVlnxi7OGOdEfbIY/b45amC
	 Tam50Gf4KvJw4FPT38EWXmONfvGomQeLJp6EhzQ2Cm8SfHEQDlPXfIGToEbsLFQn12Hkf
	 ccZj/OP1zLTQLtY/cgi+B2mfhoAQ9oYNJdH4R9PGEJczR8aRtgKF856/RKY43gCowUv/j
	 +oq678jalNu5/2a4wG7RO+wRDo9Nnj2RrqBthsjXPEmBQczhdOm+cBkPw45xuV+pi/Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H6NdFCPi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c3TCxAX6;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E32401F000FF
	for <linux-firmware@kernel.org>; Thu,  8 Oct 2026 08:40:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H6NdFCPi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c3TCxAX6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E32401F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KX7f1169986
	for <linux-firmware@kernel.org>; Thu, 8 Oct 2026 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2mxOeX9xcwRyHJZ/Ra9L3ujmJyOKtt9sy87E3e7IY4=; b=H6NdFCPiCwS/8NWh
	N1pDvVUO+RAxUmiCHdlyT5SiCmAFst6MmkaqpEQv0Iyc7MzZsoDFeKBKWaFXKCcz
	PV/ypq6wxmALBIFORIBpcc3toWVfJ8tCsJTixr4/G19sEQcDNdIRaVo+e8HGwBli
	YD+xaUR2op/PbBimr6WF10P29D1FXNrfQe2LuTGnJXtXqthMxYQW+nWnvvtxpBRH
	waNpmCjq1pwsKYxNLZPNTi/zxvRgH663VR1PQLcJu3P9zRNp63ylIAdIj08Kazyi
	+SSyf4Q4dE6TQ/k/UPP+KXLfHRqa+IXTqBq0yb+TdqfksszEgC09wllrDHU1EGg1
	3ZS28Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39xdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 08:40:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3517ee4b01cso368647eec.1
        for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 01:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791448841; x=1792053641; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2mxOeX9xcwRyHJZ/Ra9L3ujmJyOKtt9sy87E3e7IY4=;
        b=c3TCxAX6b3RtCK0spgofb3xyvJF4P9oq6neJ7c8+gnRx1wIK/he+WfzMngHrDyeR2V
         70zle+IjlgqGy1HgbwsbkXIunAvekbrd58XCZ/J83thHsJPmenbgpc9rrPHHvJo5AkVU
         eQpcFA0mmshQpudqTMoLCNtrY+AIMcHRmUlM/U/RuTnrLISz3VljA8GrffCQymtz9CCF
         X2vSiXShR/hM7Vvxfqm5SPdp54GQ+3aN4ZhcAF/9s8EJEwNrDYG+/YFkUfM4taRVd3+S
         r/rP+RIfVdwy6HahzGhS+2ZIDzs68P5oTcQTw1qsvgvdZaLoprwtTwQU7JIITXyau0LO
         ci5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448841; x=1792053641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2mxOeX9xcwRyHJZ/Ra9L3ujmJyOKtt9sy87E3e7IY4=;
        b=yniq1Wr7QDyBH/fAsCy2AhZG56/PZUuvmSwJk7m8c882GtIdGxPlzck1iLpDa1d7Us
         jp+Ceg8o7IIKN0tdqD7eGpbRWFn6mL3/uHGZ+akjaG7tVyQh8STUonH7i9OtNNcQYnyr
         3PH5fPVdAu9wKI8xMEAyMviyo2mINBxgbY/6JEsru9WNC9SGQgvhpy9TxRa40k1HVcsx
         UFWhK3+l1s8i8sDjwjcfyTNtornJP6BItA6MT/aiHiCEi/6rbm1ykO82Pt36u1uCu0kO
         6jxEZl5hjulMGWVUozJQPV2+Jul2rpH16fMfoQJ5I+rU1MOHvpp2OvpAMo5KyPPn/2RD
         C9kQ==
X-Gm-Message-State: AFuF++k/HV7DoBdBbB5z7/kDcMVCL24NpEmyyvRDD7yP07X7QfdtU9/z
	npfA+vTHwbqqPK3eWiIN3A0/stXwFRY9+Vru/A8RgWkxLKkzqYiz/VSDY/4bg4gJQH0SU/Gk0LK
	B9sOdSKLVqLxg1upt/QSHWj+ggvo5g3rt/salzKkDfjyqdwHPLGeE43VS580eP5M=
X-Gm-Gg: AYBFou2ATVjr/Vt7Lp0ISgW8VEUaj/y4JeuiWbKAwC/2LA172gk11FY3PhRPjQU+aMO
	MINySoNJnfn1H1RY0U0i0jeWqqUdAmVmtljaMWCA4+2yDwwTERfo0MQ8ENbDEPbeeOIhJoyUrxa
	i9roaS8oj27m+leH3RyfIyZl6pipw8tpfApRvhcAR1ooYReGN7O5P0g/FyJKsNlIWPY51LzE5s2
	n9yExGWkjM3m3MOiKuglcSEtV/Q64F4e/NKmXoQ6CBFmx+MLJV7CyRZ1np28KGkn/M9GCEFWznw
	4YL2+iI7nQ33UOmOGefvXp6eQe/AXprysA/pcEA/9xJLDNUrmeozDgq05k3tdl3IVOk6Vjjd3U2
	v8xTF/8+ccbBh9MQ5HjjxPiYsa8wQ
X-Received: by 2002:a05:701b:4519:10b0:143:808b:b178 with SMTP id a92af1059eb24-165a96e5f6dmr2127494c88.26.1791448840751;
        Thu, 08 Oct 2026 01:40:40 -0700 (PDT)
X-Received: by 2002:a05:701b:4519:10b0:143:808b:b178 with SMTP id a92af1059eb24-165a96e5f6dmr2127460c88.26.1791448839801;
        Thu, 08 Oct 2026 01:40:39 -0700 (PDT)
Received: from [10.219.56.173] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb6076sm15919873eec.9.2026.10.08.01.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:40:39 -0700 (PDT)
Message-ID: <80509263-f623-4708-b12e-e81e698b1004@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:10:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update HPASS firmware for nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
References: <c219edbd-beb7-4259-9167-0a0e2168b5bf@oss.qualcomm.com>
 <arxtjcj7y4yea2l2k3l3dknoyytn3aazhv2eaemnzl4ay4ayzv@z2c5l46k2yep>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <arxtjcj7y4yea2l2k3l3dknoyytn3aazhv2eaemnzl4ay4ayzv@z2c5l46k2yep>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -r5KwQTZRFk_Vgt6R1lk_2MCYBT6MGs7
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac75709 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=f28FJyRPL2d07ICro5sA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfX2Z/i0D+GqqmF
 XLFL/Ni/fF/rXX0Ja4tKOtgzOnjmxgQZM+HKAZJdoqbwNz73XubDKXvfRAxE5c6C5Qtrl7W+rOY
 e7eCSjwW6xWvlnpq7voMkMuieYlbH7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfX9DfajlWrhuSt
 kSY8l6tIb9ZNGYvS3Ne2oUckoT1O/fX8F3MvA6Fgo8qI8e2I0m5RVaqBKYZvDfQx2dnnxDrC6YQ
 ASc4LTtvcXOrpbswfvWx0gdPDk7HUqSYIPitQJT+uSOc8b3SlgeH0birLt3JB6XakeO9PWc5ha1
 Y1xnKsy5ujR9NU+1PkXuU/nZtkwTZA7668yV7MeYRYiHT5IaAKnvP6UVcEXG07SlBnDx7HMXHRj
 EKR9c3a+dEbrBrW+QDgbmSNzdWJPQz9HYfVgvXi4H3QoVLQfxE1T5RytFVyDu2BUnn4NxdkD/7S
 rNIC2qJW9UieZ3FX9lCSX9zTwt0mSlRYp+Pv5vV8NsVdiI328M1WsPDiML9+0jO7ujKdaEU3XtX
 5TBYfAMKPnjIg1U0a13p9edAsxdsFU9XrFgS+GS6RdE7El3gp/s153MlZQQmyUYHNfsUYclAGO8
 oUtuub/XBbYXjfiGQNQ==
X-Proofpoint-ORIG-GUID: -r5KwQTZRFk_Vgt6R1lk_2MCYBT6MGs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080034



On 10/8/2026 1:16 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 07:23:00PM +0530, Saddam Patan wrote:
>> The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
>>
>>    Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-hpass_new
>>
>> for you to fetch changes up to 5821af7ef9b4cd96ad1d9f9a11d5041ae4b02594:
>>
>>    qcom: update HPASS firmware for nord platform (2026-10-07 19:19:58 +0530)
> 
> What is 'KW issues'? Think about Debian or Ubuntu maintainers deciding
> how critical is the fix.
> 

There are 2 Klockwork issues Fixes:
1.Static analysis fix in the QDSSOn function prototype.
2.Out-of-bound array access fix in the Audio Framework code.
