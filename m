Return-Path: <SRS0=rR4T=X6=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EF7C3ABD9
	for <linux-firmware@archiver.kernel.org>; Wed, 14 May 2025 15:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A392C4CEEF; Wed, 14 May 2025 15:04:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04A64C4CEF3
	for <linux-firmware@kernel.org>; Wed, 14 May 2025 15:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04A64C4CEF3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuuwP030330
	for <linux-firmware@kernel.org>; Wed, 14 May 2025 15:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABl9jKANhqzzr/vAZe4CDKc9veauV3B8kvEEP2dIxNw=; b=SnyjUgcMMaPiVgCD
	oFEjYkHpDqi8YGI0JNGoBU4cXUMO+e3cN0NJt0WsFLVFc50Kp4bkekl6dleX9Ojx
	VDwpsGFprlflJ7p8p6Wsd9/isRitdV0spJXIgrbgctRdvkeyyAf7cf8JV2QsmO87
	mHgHf1uqoc5DwreAneJ+fCEFHDr9Xt0I/tTUYznSklSOzznR+ZBBh0+/5+V3VR8p
	6Fs/llfQFyzQ1OOjDpK2V5y6K/JtVCqSKtA0KqAthspWC/PR7mmkeafOGBl0z6J0
	UMG8Gl8kYDaunRcAOUgrmnd2lINQZ+sHtRgwUsP/sAWlJEFkB4en82FWxPy6gufp
	Jjo2lw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnu3j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 14 May 2025 15:04:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so3937468a12.3
        for <linux-firmware@kernel.org>; Wed, 14 May 2025 08:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235064; x=1747839864;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABl9jKANhqzzr/vAZe4CDKc9veauV3B8kvEEP2dIxNw=;
        b=nNGUfENge0pzxp8dRcPQ11PWle4Ysm+6Ilk3ST3qDBvbQ0sPqP9WugC1SkuoXNUfqA
         t16F15YbCj3qHeehu8qBXXbuvex9D/WdcH4XQX3x11YzWSD5LXsaXInKXMp1Nchd48UL
         nWx869uytJwvrIbnx7vY576ucKuII/dr7TzhqZm0AiHosruJ/dtXxOMhAsR8iPULPqTP
         +e5seNaU1wVM6/6XlmG15v+YybPxPmCKvKDqRerLqk10P8FjbDO/1cHB0rzZGzmX4yED
         1lu5ZVlT43G+0178647Pe/8NDMEQZ6WjQtrsJTDgRICFxngb2+qz5DsHGrqh7EfiV0dS
         1kTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkN33SfVTMaDzvy5WcoQ8qjr8xwutV/6aMFoZ9lpyabW8W16mkJ2kIDGCwK/Hc9yyxrpEJFA0D8EUQPUAy5g==@kernel.org
X-Gm-Message-State: AOJu0YwynMlLpY96eLK3VgMA1kcCm3VOx00QmGasOnvysV+PyzQ7eECl
	HM+JmOD71UVqS0grCOiWzzeUv8zUgXLNYLn5Lmbcp19u2BcuDofc8GEHpCO/Z5aiVd1HO8KOlEJ
	8EMf3Cx4U3nhcNALNLNuu8Ozuh7oYjAAnQW3lwJSZEif6ffssBX1OxV55Nb0=
X-Gm-Gg: ASbGnctlrWnklj+IlMB8sPz3mOh0SSYUFyUuhWGvEiObh+RK6MEIbMtBAqfWn4XP5Zb
	i2YQlWDhTbERQ2zy3Lf+KMZRzQ7uNwoQVK6bOJkLgOQDDGvohA1T4pzT615R/+vrNfcOJHRAsJO
	F2/TVuqnJuTdnVLoSqvFmOJIb87m89J4LpiqoQWbGjKRGF+9N+cOgePUrDcaJ0z9UDPxu6QTfwn
	cx8qBIRV3KX77KDOoQcTCMFSuJIzjmS5tMqACxaBZh1sRetWIJf85kKsMeSJViLF62yb4DrHAxk
	X/x7YdPbcCUzwDOFfNB/1KmaRC9EF4hSHK1/vvGw9ag9WHLIuXWjSGqctNhIU3DtSWE=
X-Received: by 2002:a17:903:1b06:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-2319813b0f2mr46446935ad.21.1747235063609;
        Wed, 14 May 2025 08:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjQ7t9o70lrzuaqlLt1wRe0tTalCwo5HCmLlKoR6bfnHAzYaJQ9Ag3++6SUvGsVhD0BfQ3VQ==
X-Received: by 2002:a17:903:1b06:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-2319813b0f2mr46446475ad.21.1747235063117;
        Wed, 14 May 2025 08:04:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829dbb7sm101127735ad.211.2025.05.14.08.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:04:22 -0700 (PDT)
Message-ID: <84238fd9-8270-487a-8709-c5d492e81cef@oss.qualcomm.com>
Date: Wed, 14 May 2025 08:04:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250424
List-Id: <linux-firmware.lore.kernel.org>
To: Mario Limonciello <superm1@kernel.org>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        "Pananchikkal, Renjith" <Renjith.Pananchikkal@amd.com>,
        Christian Heusel <christian@heusel.eu>
References: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
 <62cba955-0f4a-4b25-8ec9-065ccfa9e26e@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <62cba955-0f4a-4b25-8ec9-065ccfa9e26e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 34pTh4SMfGdktMO9PrwXkmZrfRvLjk-W
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6824b0f8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=mehdgkVfAAAA:8 a=KSb9T-wMAAAA:8
 a=PjuYqXk4AAAA:8 a=VwQbUJbxAAAA:8 a=y1C2Jo8pdxxprBwrj4UA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=J1pP9gvGZaT0y92QayzM:22 a=KF4VuIdXkMyp4E_ug72i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzNCBTYWx0ZWRfX3bzXC2cry9Do
 Ldkgr2AIH0v8cbTHa6JWOguuxSIooHsGmeXDdiIgO4hSqpAv1JLZ+Zk8S0NzS8fFDHStx+8nVSf
 6vnkRQqWxPsDKWujuvWzTX3emo9rPZBfJtmwgX43fhS66FlcHhxRrjyMSaCEngMm1UecvniAErs
 9Yn+quRHknCI6IifSINhFOguJGiYE5ltRrx2P/kdpUU3fWIuILarJcPz4U/IHNrXQVeLsoYZy7P
 k7ZxpAJwCkF+gRR0ybQULsJV523eG0oXTPW4QNSLceGuEhCZtTnFvo1QHak9Zel00bpOnY/rC/0
 WcSqmFhZZYlAtM9oVtsW0nOabylSoSw+syp3AdshmPPplf3WpMCQlLWiQe02eOor9O4xY1Snkow
 rv9E7eHGvJckGqFyWGFpF3IptTHGOHixmrE4JyA+tW1yrFqQlAENiwSxRsXRydN4SPYJaZT+
X-Proofpoint-GUID: 34pTh4SMfGdktMO9PrwXkmZrfRvLjk-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140134

On 5/14/2025 7:33 AM, Mario Limonciello wrote:
> On 4/24/2025 3:38 PM, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath11k and ath12k.
>>
>> For ath11k, update the firmware for IPQ5018 and update the board file
>> for WCN6855. For ath12k, update the firmware for WCN7850 and update
>> the board file for QCN9274.
>>
>> Please let me know if there are any problems.
>>
>> /jeff
>>
>> The following changes since commit 490c0af1d6b9ffca0523edcfad27ba483b9d6da3:
>>
>>    Merge branch 'robot/pr-0-1745490027' into 'main' (2025-04-24 13:46:05 +0000)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250424
>>
>> for you to fetch changes up to ce13d29c3933f77674cf45855668485c48d3eba0:
>>
>>    ath11k: WCN6855 hw2.0: update board-2.bin (2025-04-24 13:04:20 -0700)
>>
>> ----------------------------------------------------------------
>> Jeff Johnson (4):
>>        ath12k: QCN9274 hw2.0: update board-2.bin
>>        ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>        ath11k: IPQ5018 hw1.0: update to WLAN.HK.2.6.0.1-01300-QCAHKSWPL_SILICONZ-1
>>        ath11k: WCN6855 hw2.0: update board-2.bin
>>
>>   WHENCE                           |    4 +-
>>   ath11k/IPQ5018/hw1.0/Notice.txt  | 3918 +++-----------------------------------
>>   ath11k/IPQ5018/hw1.0/q6_fw.b00   |  Bin 532 -> 532 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b01   |  Bin 520 -> 520 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b04   |  Bin 86788 -> 86788 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b08   |  Bin 4096 -> 4096 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b09   |  Bin 2334720 -> 2334720 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b10   |  Bin 269220 -> 269252 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b11   |  Bin 99456 -> 99456 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b13   |  Bin 7072 -> 7080 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.mdt   |  Bin 1052 -> 1052 bytes
>>   ath11k/WCN6855/hw2.0/board-2.bin |  Bin 6429240 -> 6429240 bytes
>>   ath12k/QCN9274/hw2.0/board-2.bin |  Bin 1308544 -> 2626240 bytes
>>   ath12k/WCN7850/hw2.0/amss.bin    |  Bin 6000704 -> 6082624 bytes
>>   ath12k/WCN7850/hw2.0/m3.bin      |  Bin 299660 -> 299660 bytes
>>   15 files changed, 315 insertions(+), 3607 deletions(-)
>>
> 
> FWIW - this appears to have broken Wifi for a bunch of people.
> 
> https://discuss.cachyos.org/t/wifi-interface-fails-to-initialize-after-linux-firmware-upgrade-qualcomm-wcn7850-ath12k/8765
> 
> https://bugzilla.opensuse.org/show_bug.cgi?id=1241986
> 
> https://www.reddit.com/r/archlinux/comments/1kja6f9/ath12k_regression_on_latest_linuxfirmware_upgrade/


yes, the underlying issue has been found and a new firmware will be available
soon. (internal POCs BCC'ed)

/jeff
