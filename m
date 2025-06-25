Return-Path: <SRS0=vyLh=ZI=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F1DC77B7C
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Jun 2025 02:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6864C4CEF0; Wed, 25 Jun 2025 02:13:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3BA1C4CEE3
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3BA1C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OG9jrL032017
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulZm9Z7CVrL6a6JjV0AkgaizpdkQ1p7soCQ4geq1USg=; b=WmP7A5yxwtk5suU/
	NhN0Y2MzJX5af2aXD5Eayvu4dOHVU5gHp1qNg57+EsXAts273VjoueuvC93Lj9d/
	L5EKecMgGAjDNjPj1+xEiMiEPluRyr79OybIRhAiVehVtV6hxiTDahOGu8XAdoep
	MF7sKayWt9fCvPZB3fnwehHomTCIiLwPhkDvfRYUT0cXovWQRgSS9QYwN52gIA1h
	srnJmMNC6gsYm8DkXFP6Ouo10CPoymL2jJD7Yv1bYoQu4h0k8NlAhsgI/N0Vrld9
	j3tAMkNUFXbDRf1YZ7dCHk263vs2RIZ4HVrWc2i8+sDRztJVVKkLlR3Oiu453cGS
	dJQx0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4qecg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:13:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so1230911685a.1
        for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 19:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750817589; x=1751422389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulZm9Z7CVrL6a6JjV0AkgaizpdkQ1p7soCQ4geq1USg=;
        b=siQ836Lw8/ydT69NM6yUUlz4EZxmHkgm29HMoIyhx4Xai2qgr2i5C4WAtcIcDASAW1
         pgubd6NTndRY7VDLLeoz0LPrMDcpElvqfGVgTSIfJu+Ox7YIZBajDJ7yM1xdNWpZavok
         TZcfqEKtJBumz2/nFMlsZuAeklKN5xMnHIjaKbCV2kvRKBOxQkIHayNF0qpSpvuxQ2iO
         TlHHrtJDCC65bLU+c8ijb0GzV8Ll3OQfa8H+0QRSL56fTTTru4StCYk+nyfGG+uELIRE
         QlhWJagTUs2QkeZf8+jU3sADxW5YISzd1o5owt6k0DPBCW/xZVenhW0TXxsJgUtpriJ6
         F69A==
X-Gm-Message-State: AOJu0Yw93DFUumoXNYOi4JJy/hCyf56Z7E4LY3jOk7vhncNlBmQ9kL0n
	zaN8T5Znvpyn9OQOueyPIC/JyibAfYy4srlnfnPlqIczsL94oSPSexQz3w4vAGNLJmQBORjsQF2
	yNWjqeyXYx2BZlTxr2Xfw7gro803SD5YalFnb0qReEVXphqb1ZNpmfRK+hCPV2Ew=
X-Gm-Gg: ASbGncudJM9JNfRm41hJZU5oFgj6F5WS8kDXlXqxVNh9JeYSjVsKEph99NHGd6JyUao
	8u+o49kXB5ev8Mfzd9Ps/f9hYfknVL+aLNW4H/V50p/AGsnQsAzGQa8J9nDlozTYjqyBavFqgnS
	md7Q5MFfxPTKMx3okfZQdrrB3rgJQ+yxac5qnSYqi9JpmcjX32iMxlB3rvUWMnoxPmGrpo1XpEe
	X2BICS/5jyTHVi10v8s8x2rsk3zDFHKW23QDB3EN0RuBHHHPwKvBumEW9qO4CiWKV7kzfZAKzy8
	j4rftO4pSIn+vLNuYVkgpIg8m2hYvq4hCVPZ8O2CpopzU3kFuts1WGydbHrihUZOwXsR7HSdNf9
	REFTpg765/n9m5aeFKfjJOKr/
X-Received: by 2002:a05:620a:3720:b0:7d3:b9b6:f1b9 with SMTP id af79cd13be357-7d42972d50fmr193959085a.26.1750817589409;
        Tue, 24 Jun 2025 19:13:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN9PeK15ginD2sBx4TPmYXHZIMZM0DdbWaWrW0z+LRXtYLBD9zWzoQj2AERnZgSYY0r4gz1A==
X-Received: by 2002:a05:620a:3720:b0:7d3:b9b6:f1b9 with SMTP id af79cd13be357-7d42972d50fmr193957185a.26.1750817588979;
        Tue, 24 Jun 2025 19:13:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97fd6e63sm18493081fa.48.2025.06.24.19.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 19:13:08 -0700 (PDT)
Message-ID: <c70fd665-dd07-4be0-937e-5c648d11c824@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 05:13:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: add the firmware binary signed with Sectools v2 for qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        quic_tingweiz@quicinc.com, quic_wangaow@quicinc.com
References: <8db66c86-3624-4e7b-a0de-91895d423214@quicinc.com>
 <ae4m27szjv5rp6d343l2pjxvbbcr42whxyuwq2bfvxxpq6zvjn@kmbtwbbijf7t>
 <c1f08c44-174c-4da2-8ae5-9969c27404b6@quicinc.com>
 <344a13e0-47e1-47ec-bc36-e5b576e1565c@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <344a13e0-47e1-47ec-bc36-e5b576e1565c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685b5b36 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=1_ZOvhC1EXeRuwxCUSwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: f1AaR2s_AfQmY0RP2cOIiAGlij1ZbN9j
X-Proofpoint-ORIG-GUID: f1AaR2s_AfQmY0RP2cOIiAGlij1ZbN9j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAxNiBTYWx0ZWRfX7x5FJaHj6ege
 8t44ljGP1SXAMIyONVyqd+VgN4CBY+BzySdBawoU/rlrPQ5cnZQx9JrARPnjG1T5kT5dnGe+kFz
 76N1/XP2pcKIiqdevdQltr+eCXZWn5d4WInB9TC+wqxsq7DsqaSurYc2GuGftSyVsMUREPlvwyH
 xsJFHkEw2IgDyXEjQEKZp67HLlI2JyW/RzeY9u009cMW7GfVvPX4sB9dTDnDTCnp+w+R1HJsVLg
 gHyHDCXmsMtFD07LzLHDGr/S/ZZWwkzeGO9zJr+E/hn9yzh1nCg4p6pbTHeCzSRhJ8Uu+KfI5C8
 uulX7MeumKxeFvN1jfQ9QKWBN2hJ2TRCzLVcSNKikdza+Pk0sapaalI4drL0rgEIFz5uhQguQh3
 RJXIuEoS/LYJDBfyFu8aiPeZ1IbZoVpenJlCU5tFNWPpTyb+cOCerj4HAhylfJDd5SI2OfBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=766
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250016

On 25/06/2025 05:00, Renjiang Han wrote:
> 
> On 6/25/2025 9:43 AM, Renjiang Han wrote:
>>
>> On 6/25/2025 6:39 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 24, 2025 at 05:11:37PM +0800, Renjiang Han wrote:
>>>> Hello
>>>>
>>>> The following changes since commit 
>>>> dbfe16e9e8acc74c018c39e541bdc3669b37f301:
>>>>
>>>>    Revert "qcom: Add sdx61 Foxconn vendor firmware image 
>>>> file" (2025-06-23
>>>> 12:15:33 -0400)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> video-fw-qcs615
>>>>
>>>> for you to fetch changes up to 
>>>> c319d6bea7a692fd9cee01d662dbbe8101e052f6:
>>>>
>>>>    qcom: venus-5.4: add the firmware binary for qcs615 (2025-06-24 
>>>> 14:30:27
>>>> +0530)
>>> Well... No. Existing qcom/venus-5.4/venus.mbn already supports SOC_ID
>>> 6007, it uses the same MBN header (6) and PSS/SHA256 signature scheme.
>>> Please describe actual differences.
>>>
>>> Moreover, you are trying to push a newer version of the firmware
>>> under the cover of providing a file with different signature. Even if
>>> there is a need for a different signature, original firmware should also
>>> be upgraded to the same version.
>>>
>>> So... NAK.
>>
>> Got it. Thanks for your comment.
>> The qcom/venus-5.4/venus.mbn is used for both QCS615 and SC7180.
>> However, the TZ on QCS615 has been upgraded and now requires signing
>> with Sectools v2, as mandated by the updated TZ. On the other hand,
>> the TZ on SC7180 has not been upgraded and still requires signing with
>> Sectools v1.
>>
> Also, if the firmware on QCS615 is still signed with Sectools v1,
> the venus.mbn will be signed with the wrong PK hash in the build,
> which leads to image loading failure on secure devices.

Your file is still signed with the 'test' PK. Secure devices will fail 
to load it anyway. They have to use the firmware which is signed with 
the correct PK rather than the 'test' one.

Certificate: C=US,CN=SECTOOLS 2K KEY WITH EXP 65537 TEST ROOT,L=San 
Diego,O=QUALCOMM,OU=CDMA Technologies,OU=General Use Test Key (for 
testing only)
     Certificate: C=US,CN=SECTOOLS 2K KEY WITH EXP 65537 TEST CA 0,L=San 
Diego,O=QUALCOMM,OU=CDMA Technologies,OU=General Use Test Key 0 (for 
testing only)
         Certificate: C=US,STATEORPROVINCENAME=California,CN=SecTools 
Test User,O=SecTools,L=San Diego


-- 
With best wishes
Dmitry
