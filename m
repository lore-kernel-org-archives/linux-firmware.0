Return-Path: <SRS0=fofI=BR=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A47FF6E84
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Mar 2026 21:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69B52C2BC9E; Tue, 17 Mar 2026 21:19:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21498C4CEF7
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 21:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21498C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJdH1161197
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 21:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=; b=U4A9jp91jXJEnARF
	xCpT5KTWmJbVolgd+qrizSi+kJ5qDiVJzVlHKEGnkxmAco3RI4KWwCNOAvZdQ6Ie
	cjyhcAZyXT8naCLLpw61q6p7124mSHr8fqJdPoMxHfAgShfjWbQgO/TZMFZo/jaE
	otu1XjhAVA2zXzlOCKOve4Y21ywKl/xrs1OSNX3GjxXH4bW0agSyTr9zFtFx4OsD
	De0eIfsSdoBo63SgVRRtSgrFtt8czC6XfJChbfHBF5Z6v0PLGYJSKELp+xKmx6j2
	uTpm/3arTwpKuCAIoYSOBozeWGU7sdqZSq6whf2C/77SG0N272ziuhOA73kebwOW
	oth4rA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxk2j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 21:19:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0cd2e4aa6so10222957eec.0
        for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 14:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773782390; x=1774387190; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=;
        b=VTHge2W2WdB8RItssEpb57jOy7rZ+CP+NZrIgocW5T1g5KZhoMXQ5AF16eP4fBAEnR
         L6Gr7wbcbK4HQ8zvmBq1jqSkw9IDKKBF0MwPeB8WKgGznZT4rO0dSHgBnu3CPbFD7nbS
         lOAA6Ql5MYarQMdqvTy1YheKOO5mRhfqVUUhUTZNC1V5iJqTtihbL7Ng0GgMnLrUzm62
         w7KA0vcTaKqrc0enpwJ7EY5izmhGsKsu0Et8b31lPw7b8HMKk6xvJYZvGspWVjOXtF8b
         wZr44tp6Lyh4eDsGErJyVDC3l9thNNwxYLPr5FMGO4iVuoDj8bvU7i6mGUj1Na3QUtzo
         M99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782390; x=1774387190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=;
        b=N5B8j/pZCnUopJI5eLkWAJ2tLs27Lg7MR/4PV+i8UwgyebiRqVyuyV3Q5IbfUReEFE
         dRldOj5ogP5psB6c0C8zWlpfM+A6hDUToj1qPMPGzVQ6EC93RdDnsBL8nrpryMJgvZl1
         xCSsWcvSICAduGvin1eHHDTBPjrU1fB/UyG/vsr9CdIo86zI07K+5FIXEul7/QHTnv1a
         fxvBZMTaJguyLcZdHocmsJbA4rHVSJNcMR+ekRmxIOZNPftk05GkNR6iP6RuB9xeinX4
         KHS+F8dBLwN++g8jrSmEMBTpT7EYyJ7+7vscp6HJVyUoyrjKdYwA8IqvE/1IeLiGdiZ6
         uk2A==
X-Gm-Message-State: AOJu0YzV7IItC14RdvZ+oBIgrZz9g8C/pwebAWHfGb44RSHW3RtaLvVm
	R7bbV7oL+iEyeVdanY7oWWIX3+ghsRjmVg6EQheHYL/P7M4VSgEi5zATq7gqJ1ttlE1R9krRzpS
	/FlRbZm0XizSvXOJqhPEPJMY9G48AU+einSXiSLuZh/PKAh1fQ2R6oJdqCmsTE+Q=
X-Gm-Gg: ATEYQzx4SQt6/fwBL6NDGDer3bbLMcvKtcElO3O51xxeY9UyxenebH8PufnhRLGz432
	E4nu4kjs1mGPRZsjnerzGQJY5djMY57VIY9cWvSBCCkXSH4i+kH/thdNomAfCIJ9w8HEakGzz3x
	WGZ0/UZL3AEIsMl5hdxJw7vfLXlrJjN0mQrpElKtx2sEgo4dRnfxOZahQvJYLFuDKi842Nk+Hc6
	vkuttCApHSwyoKnaBmBprRncrW2C8yKS2ej6VNNCQhZV5yyxrANE62K3x6aLrPEAYt+q50+Abtu
	OSLz3ErCDWqljNN61mp0S2O13+zW+4bBCe/pOFEiFFXeUERdLB3LhRtRK0VyvvcVXdKGW7ooSCC
	gm2waNVWVZ6aIYVqycq4MXHsFq/rz6UyK6tL+AYnK5Sna3uBJleHhdJTlirfWV5QTc3E1eqeWT/
	c4rii/vzZYWTq/Pg==
X-Received: by 2002:a05:7300:fb97:b0:2be:9886:d4cc with SMTP id 5a478bee46e88-2c0e4feaf75mr548367eec.3.1773782390462;
        Tue, 17 Mar 2026 14:19:50 -0700 (PDT)
X-Received: by 2002:a05:7300:fb97:b0:2be:9886:d4cc with SMTP id 5a478bee46e88-2c0e4feaf75mr548358eec.3.1773782389960;
        Tue, 17 Mar 2026 14:19:49 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm970898eec.30.2026.03.17.14.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 14:19:49 -0700 (PDT)
Message-ID: <e22e4dc4-a98a-417c-9b18-8836ec56ff56@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:19:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260317
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
 <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2FrM8xkz8BQX6zrr2JmJpPiUF_4IFPfq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE4NyBTYWx0ZWRfX5RCOjCEbnC/L
 GdZSseLVsoVfstWZx8LWmlRsQaGuVZIlDhJvSA6DLCr9me5d21vpo7AdzXN2ZpWsQamBmOPzjRx
 baCcTWpX583/H5YR/rl37qG1XMAmvngz3fu4ZbZgRDlyoyoyLAG09lKHBY0ZhlRQOB6sRALlD4H
 jcrO3IerTop77ayErrw4CGtbsSh4/NLk4/8RoYhPghPl7cbIuY9dR+lZzCiF9tNMV03Osi0y5qL
 3Tt4cIFAo1mnrUpLnCNqLCyh9xASKMDVoaLKLHvjEOPltlHv3w8ctUKgHXVCF299uWT4/Cu5S98
 5/anTXo4zkmePhiuiYiPVIpiX/prziwW7I1HoH4h9rAzYcNwKwCpsx00h2gTKe0o9g4Om+z9wLp
 Xvmx4F8X/3yVyGIMkzpC/C5H5iOulJ4W9v9RP3SxOCjUFsud0ImXeIYMLKrZKjUOoz8ykPbBgml
 KMZRAX8VPY4tXKvJEfQ==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b9c577 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=Lpt2Xbyv4YudqlJ1IEcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 2FrM8xkz8BQX6zrr2JmJpPiUF_4IFPfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170187

On 3/17/2026 1:58 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 01:18:59PM -0700, Jeff Johnson wrote:
>> The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:
>>
>>   Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317
>>
>> for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:
>>
>>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)
>>
>> ----------------------------------------------------------------
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k.
>>
>> No updates for ath10k or ath11k
>>
>> For ath12k:
>> Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
>> and Automotive.
> 
> Thanks, updated and pushed out.
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/962
> 
> In future, could you please include similar information into the commit
> message too?

ACK
