Return-Path: <SRS0=vyLh=ZI=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5C3C77B7F
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Jun 2025 02:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6B25C4CEF1; Wed, 25 Jun 2025 02:09:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B70EFC4CEE3
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B70EFC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFCCN2028021
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vRwf7NncqyJ4oBoyHbzfEBa2imK0/vvSJt2dBz3qJ0=; b=ngZrqxkiHFvHHRmf
	NeyowyDsBGy4kgBDFIUJyeAw7sIbpTXD6UgbHI82N3bmBp3bW2SFeop3RkL1qAUd
	qXAJ9BM6htj7Sbfk/f2P7cPkhL13E0PVaVFzPYFCQvAvTB6yzP+ZhCehexSOfm20
	m/CD94i9CfWYRflOxSqcl7CvlkF/Bj7hwn/HIOO5ayBBWZT6p7D5d4+l5mQ7xocS
	+1FTa4ERhPOVYGpi01BD4/iWgnT+v5aP2FaR4Ni6GrcwtJX/tNJUbaf8ngLHUPWg
	4r49h34SLdcyWAq0Ha2M/ObCfeNdLoMid1bjlQCwdxbSfv5ELncJu+abxo1RbrMk
	VyZdBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqmnwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:09:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0981315c8so466184285a.0
        for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 19:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750817382; x=1751422182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vRwf7NncqyJ4oBoyHbzfEBa2imK0/vvSJt2dBz3qJ0=;
        b=pnPaekVjMmIVMyqtok19dB9d8RsjN4410SuB+77pr/sQmilA102iq8SvM8HxAf7HlS
         eMxNxZ+oQK8SplmDZjXia3cuWKm09bDNfhzhDL0Imscb9sL98N8JL+jTdPp4QBJ2XKiX
         ao24JdT0a+I7C4gLK+KBP0QvQ3tdjxUbxbZSUVl88EpFX5R/m8XEixrXzac8wEMOiZSW
         BP++0uFt5jA0sNHs11+gikX8vxnwtwYUZ1LA5sBwvZVlw0VuUHPEbAOq+1CCFkvgk6h/
         yVPTtNHa1xbHDeTGlvHOn43ElDKQlIhS7dOutfLQfQiCd2MgUe7clJkHmMAYnhlDY/Oo
         al3A==
X-Gm-Message-State: AOJu0YxEyyR+1PCIFRTEqlPtfq/nHrMobzYqOVpKCL3FmQRuHJeGU+bH
	qPDVp9VUAqTG2ghxv7qzxcdUDDDp14e3EJqiKKxBER47lBtCOfzM1Qxt+CjqnhaOK79sbZLhznY
	QG1eut1BI/jgeAz9RRxYXaFDD0WlwI+kC/d/pj4U+VhTXzq1UXXnPwmd914AHWeI=
X-Gm-Gg: ASbGncv4zXdSaQBR3CXrE70lXcUM+ATZTM2z8a+FgPEwO8qHeujIp/j/DiPNH6PQAyY
	MCJhdzmgXHPw70XtsVhurTTyABDQYK5DKXaibL51lZj4ycHsdWKJ+WwLdY+HGoxucmSuJvIQLFJ
	RI1VOyYUMx9L8lnS2uoW5wlXCsOebpGfVhHk9CSxlFzuDHovjQCHDNJsdZojGNp3lHy/nVe6W3F
	dJSrOuMShNHwYzpW8M5dJA7rQn9v/uAxM3bKAWCVA8fZbXEYZ9ZuANOWpMXAX8CWK1KuOaYZApD
	t2hEiEZeK2ikdUAcppdbvA/YkZfiRHOTBhEUzlAWfI/e0NECKxPwcyTSNmbPBCRkN+KDy09ii97
	9ZkOjtAl5o39xndwzkG96DOd1
X-Received: by 2002:a05:620a:880c:b0:7ca:ea9a:828c with SMTP id af79cd13be357-7d4297aadafmr212620385a.48.1750817382471;
        Tue, 24 Jun 2025 19:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQr3CPxhfkdum9njl17xK6oU4io1FiIQcl6VBP0Lig5srhB3emUEsvma/UGyX0BahY4nimXQ==
X-Received: by 2002:a05:620a:880c:b0:7ca:ea9a:828c with SMTP id af79cd13be357-7d4297aadafmr212617485a.48.1750817382005;
        Tue, 24 Jun 2025 19:09:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cc78sm2032068e87.63.2025.06.24.19.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 19:09:40 -0700 (PDT)
Message-ID: <120c10e4-45ae-47ae-8594-434c42dae687@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 05:09:39 +0300
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
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <c1f08c44-174c-4da2-8ae5-9969c27404b6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0o5Jcek97LKg64lTLPiIOi9kdu21Q20p
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685b5a67 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=2zwrOR4aHVC4AtwhbYUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 0o5Jcek97LKg64lTLPiIOi9kdu21Q20p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAxNSBTYWx0ZWRfX+rvNwI4VKXL0
 G0LLxZTgElcz3gQb2zuVJA8TbBTL3ptDfYbvYOCLTIlLHZvgbqekxglWpHENfG6x8Z80g2vqehE
 V2PyS7PDapv6pYUwjeIc6M3wXKy3WEW7hOSmR7VAR8fX9OV7GWvM60oq8Z6kUbAsXR1574A3sx8
 qPI1miMfCyo+ig7UmcrkNvqU0R+SLzyciYwAONQNkS0sLtxdu8b5u54ShqVr1yAjNbTUS8QdCEs
 7aQhaJTnuVHzEwf1YQEfeTfFU/QOtswhfeFRkf9DV6MoE+8uPog4JHJC0zL2h9dLrNBq0RkbU+O
 FT6rsCrg3offh4YK4CfBA5hK/gLUyrFN5hyC/jqNddQu+AgB3mkX8MOCcWINOkqDsKWFs7Wsl3Y
 i14DJuciyqxsUSXK3rFA0A2PMAT+fXnQCxyf4EBke4dDsALPo5nqS8qsXYepeeIwsVT7Xecf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=789 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250015

On 25/06/2025 04:43, Renjiang Han wrote:
> 
> On 6/25/2025 6:39 AM, Dmitry Baryshkov wrote:
>> On Tue, Jun 24, 2025 at 05:11:37PM +0800, Renjiang Han wrote:
>>> Hello
>>>
>>> The following changes since commit 
>>> dbfe16e9e8acc74c018c39e541bdc3669b37f301:
>>>
>>>    Revert "qcom: Add sdx61 Foxconn vendor firmware image 
>>> file" (2025-06-23
>>> 12:15:33 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>> video-fw-qcs615
>>>
>>> for you to fetch changes up to c319d6bea7a692fd9cee01d662dbbe8101e052f6:
>>>
>>>    qcom: venus-5.4: add the firmware binary for qcs615 (2025-06-24 
>>> 14:30:27
>>> +0530)
>> Well... No. Existing qcom/venus-5.4/venus.mbn already supports SOC_ID
>> 6007, it uses the same MBN header (6) and PSS/SHA256 signature scheme.
>> Please describe actual differences.
>>
>> Moreover, you are trying to push a newer version of the firmware
>> under the cover of providing a file with different signature. Even if
>> there is a need for a different signature, original firmware should also
>> be upgraded to the same version.
>>
>> So... NAK.
> 
> Got it. Thanks for your comment.
> The qcom/venus-5.4/venus.mbn is used for both QCS615 and SC7180.
> However, the TZ on QCS615 has been upgraded and now requires signing
> with Sectools v2, as mandated by the updated TZ. On the other hand,
> the TZ on SC7180 has not been upgraded and still requires signing with
> Sectools v1.

This doesn't answer, what is the actual difference? Without additional 
details, NAK.

-- 
With best wishes
Dmitry
