Return-Path: <SRS0=KPQN=33=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB565CAC599
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Sep 2025 10:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACB96C4CEF0; Tue, 16 Sep 2025 10:22:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D77C5C4CEEB
	for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 10:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D77C5C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAHeX8005242
	for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 10:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7UCVwib6C0SZRsTAZk5ESMXvtOfYENMz0uGPLvwfjI8=; b=H1Sb2CLPrzqVwqE8
	DBbMlMsT4xQAijQGdAVCz43CiDX6tg3lGdCavH9gjo1qXSvMV3wPpFcP4QZbDVQA
	z2XgkbCZ3lpMcshjArnvmT6CqqboATPtCPb2NyDNv30pNiDMuxa98f6RYfrcc+Ch
	5gDITCUWn96ye57m0iqz5X9BL+cb5w1fIDjKlI4ktupjtarrHho7znn4u2alF90i
	J7p1n8X19upy8I0gR7owf82y9YQjgAjJ0RMdMBM3NFm0p071uYvvVYKUmS2aCbI5
	/pkIQ67M4qZ1pye7bM/cQPihEF2fBuMzsuQ+vCjzpFiP5YqTzeF72c2spxZGcatk
	WjRYeA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n45v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 10:22:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77429fb6ce4so4981390b3a.2
        for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 03:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018150; x=1758622950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UCVwib6C0SZRsTAZk5ESMXvtOfYENMz0uGPLvwfjI8=;
        b=fd1qVFQBN3RdSbEq7hY16Zq5gzPTD0pljwkwKjubL8ezyVZSi7NbYgYRF2SkeVWG1P
         PkAKnJXnI9rHzYykLPAC6OulPJqMziB5NJdo3xBOb5VFGkQlqG7Fg/9tVNN5RYBPLK+U
         4hCGh3MrzHIJTTzYE6kzhCyb/f7t1zu3s2CaaJWsAUKxxluToeWfMAA5O4rKttu23LV8
         tWhR4TnTh55NmBwhSa2KAN17jawHZAZTvDyOorOqCGuDEnfvg6IWmODePIAAEHDdrLTL
         AC/h3pJV2uDibfg1FrJ0pHiiG4yuJjtE/m/OT4MHRbWeu0pkCcyHDh/aRhyipegGhztL
         UkmQ==
X-Gm-Message-State: AOJu0Yy/RbEhUGw/JkXzBYhaCcv/uc2YBaxKRLNpo3XiJf+Ai7RxNjEi
	PAl8iCO6A/FGeZ2E1jpc5llKeT7jUucTXHpYuEflL8gC1ma9uDnRJ/JhdZgNzucKuPeSggXI3ou
	nD01eELKBPOIYjnOT4W3eQSpHKbQ8He/66Mn+AzDoZDGJeCM45gBzgdBxkhB6z9E=
X-Gm-Gg: ASbGncunuw/+SkJwyJN0B5mxcEf8WXvgMY6kehEihNN+v9UxwgBdCTw3NRwg1shPt8e
	iDcw2Tg2Tk8Y2wPb223s4curEQR9CdMdQQ1lXanI9O/LhEh9zm1T1Ht44kpTH0YTfngNQZ5FfX3
	KS1N/GQ9u8eLOxeBTo9nFcGjZ5eOwWpb29sahnkw7YAVq+CwIxoOSMRziV+Y16ZXoIg3lQX22cI
	wqrhCDp2SKAZN1hDh2bfj8YTrNcw6/A6bZaQkO5FNM8RmADdkBNOeu/ZUTWEeVyqOR2EIkF959K
	P3waWzjFvtWWC24uMthRFe+M1+glMv3yteGPLdOYUiR0R9BAAC+0Ia26Xd8wf1Tq0esG
X-Received: by 2002:a05:6a00:2e96:b0:777:8ba9:d200 with SMTP id d2e1a72fcca58-7778ba9d382mr9064162b3a.10.1758018149960;
        Tue, 16 Sep 2025 03:22:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQnqIFOuu6IeuLflpZSHD2FR+MEj0TYS1XLKqG2+eMdJyXmD64jDnxymb+GxqmF4G0TaJNwg==
X-Received: by 2002:a05:6a00:2e96:b0:777:8ba9:d200 with SMTP id d2e1a72fcca58-7778ba9d382mr9064134b3a.10.1758018149439;
        Tue, 16 Sep 2025 03:22:29 -0700 (PDT)
Received: from [10.204.86.37] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761473eefasm12935813b3a.97.2025.09.16.03.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:22:29 -0700 (PDT)
Message-ID: <87f13c96-a334-490b-ad9e-cc6fbded6440@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 15:52:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com
References: <bc6d5804-1967-4b59-8de8-17e8bc2313cf@oss.qualcomm.com>
 <xopfgtlzht3l2clqwydghyzckpub3brocmwvclchbi5gigst3h@plhqa3gpdire>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <xopfgtlzht3l2clqwydghyzckpub3brocmwvclchbi5gigst3h@plhqa3gpdire>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6UIr4ty0ABdjU5P9bE9VfkrtExV0HC7a
X-Proofpoint-ORIG-GUID: 6UIr4ty0ABdjU5P9bE9VfkrtExV0HC7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfXwbCz08BeXHDJ
 enZqkrXqy6Ieo21Hc+ON8LbsG+6Ue6xW6E3lTXG5tHV6ABbByM2CMTnPSCfK9U6IXmJKAHAg5DR
 qq2v/O+CbH0R8vVJQfJCJzRowk+aNqUMRNByUjSkMvZeEmnoh1epjxxembuerj+iELmew1tu0H2
 NOeVKch0vgAWprI0cDmVuwPe8a7ZZlicEpkjZqeZ7uexSPGUBjvipBk7isw7XfuPFDpcv6ZMwVn
 RevRQQZQbGL42x8ZGmi8yU75/zBToDyxYrqs6y8+AZ6DGt06/gpzYaVA0d+SXeloqGuvEKiVB03
 cXlS387V/wU+H/fzYTjWXTC7d2h9JXyHUGxwI7fU+oQHMZUXCgQlAsEKPbcgmi1zroe6U9dDk2E
 C+MWdITN
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c93a66 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=Klf5URkHi8Gv0vgH1DsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087



On 9/11/2025 5:27 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 05:04:13PM +0530, Venkata Kota wrote:
>> The following changes since commit 4573c02ca0caf001c5ce5dbb62015d588258588b:
>>
>>    Merge branch 'mt7922' into 'main' (2025-09-09 12:02:45 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-qcs8300-dsp125
>>
>> for you to fetch changes up to 13410ff8f90a06e2544236b13384f3068d335ac4:
>>
>>    Updated adsp cdsp and  gpdsp frimware for Qualcomm QCS8300 platform
>> (2025-09-11 13:28:42 +0530)
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        Updated adsp cdsp and  gpdsp frimware for Qualcomm QCS8300 platform
> 
> - Missing commit message.
> - Subject doesn't start with qcom: prefix.
> - It should be 'DSP' rather than 'dsp'.
> - Rogue doublespace in the subject.
> - You've added a bunch of files, but didn't mention them in the WHENCE
>    file.
Ack. Will address these points in the next spin.> - As far as I 
remember, GPDSP1 isn't present on QCS8300.
I see adsp and gpdsp1 fw for QCS8300 is same as that of QCS9100
I accidentally picked gpdsp1 from QCS9100 here. Will Rectify the same.
> - Adding audio_pd to the GPDSP needs at least some explanation (in the
>    commit message).
gpdsp1 has a capability of supporting audio pd but at this point there 
is no active use case for audio pd on gpdsp for qcs8300. Should I drop 
this for qcs8300 all together.>
>>
>>   WHENCE                   |   6 +++---
>>   qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>>   qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3092480 bytes
>>   qcom/qcs8300/gpdsp1.mbn  | Bin 0 -> 5844992 bytes
>>   qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>>   qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>>   6 files changed, 54 insertions(+), 3 deletions(-)
>>   create mode 100644 qcom/qcs8300/gpdsp1.mbn
>>   create mode 100644 qcom/qcs8300/gpdspr.jsn
>>   create mode 100644 qcom/qcs8300/gpdspua.jsn
> 

