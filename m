Return-Path: <SRS0=Iq2n=2O=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB7EC87FD2
	for <linux-firmware@archiver.kernel.org>; Sat,  2 Aug 2025 10:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EDE4C4CEF6; Sat,  2 Aug 2025 10:47:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3797DC4CEEF
	for <linux-firmware@kernel.org>; Sat,  2 Aug 2025 10:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3797DC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725f1ih017475
	for <linux-firmware@kernel.org>; Sat, 2 Aug 2025 10:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahjTNh5GqPuH3H1tIj5tpFoepS1+8JwSX2uF3swjfdQ=; b=jCoxt5eRbNKi3+L7
	KgrWJE04BrEYmotAVxi2eC8la9aogzIkqlaS8K1RIX68uZr3sBq/BD8VbeDcEc5w
	gGVNtz7tL2NY30tYieNta5JaoBvKrfNft4uizz4jAgY/9GNtHhFXzajt/jGPnSKX
	va+OVwFlbUdE+MvramzFt/jrQX3q2DrmIBZY7bkqz+9DoAZiWsBKb2IAMTDUiVOE
	j9L750jyHJ0dhE8apKW0joCO8Orp5fUDzTTImMX0O0PjVn1J1RMZAACFqUVQ4WW2
	mxNiedr8H9x2sKcmWvtx1OxRXWe+Q/67xwyyK3DfS2feC5xuIpi6Ud3N8tlvkuDX
	Y/n1Ag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899pa8s2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 02 Aug 2025 10:47:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2369dd58602so21552125ad.1
        for <linux-firmware@kernel.org>; Sat, 02 Aug 2025 03:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754131611; x=1754736411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahjTNh5GqPuH3H1tIj5tpFoepS1+8JwSX2uF3swjfdQ=;
        b=YVDoUPjyfAvV/ZzJ4AADmWxUk0sCAUUsKnQniCE6OkjhXdV+fn87+T68GoiJqzqaxv
         PxLxAOcjs2DMjBpUd1HJR8WZjy6FXz8+msVb/t7Nzso3ql3/8HDGg090IvtTl7WVpVau
         NdKPqaLL1JWLUuGECC+u1vrGXpLugoyEQOD/TvQEepWwGfPehS3hEqtRTn3R8s4lliw8
         8kXOTxgVJe23Phqoz7Y/36u6VwfpoSxuOjB+SDIJsdqn3RZ2zSRP3EIP90MmulaP4pi5
         w6czudzGP0DpwHvdah1FSgtK8nWyxOby9Q/ar5OgwJbnB7t6Z34BzX6y4HXl867VZNH7
         29UQ==
X-Gm-Message-State: AOJu0YyRq6FigR6eu9fibJumK/p36n5iEFaAn7wrs741+pW3FPvlCSmF
	uQmehS+g5GOjqwKBX5mBXVUn8zYX+T0xxckjvucU7DUBDYEmCHZ7AT1YtDozR0orTHNgnXkQsGW
	E+5FQezsPfTagFT9UjBHwj1mdulUOSx6k4Vv3b2b0USIZs5AVd+SfXpgaShnakinbPLO9BCQ=
X-Gm-Gg: ASbGncshZCE78sz2tvddvn0HqEq7rBQ/yiKKoC1/60Eb4VvdUra1Fi1nyoN+nEFdo8q
	K3C5Egyv/Qhpj6+pVGxndxt1nEOfW1Yc3EbT6ueC0y++7o9G1tWeLJTjwVD6r3fwxjfUTJSffbR
	oBBzgQUZyi6VfgZSKMD1MXt4zdzsx6i2TUa+PGTP2p79M2BDYgrh3PYABa+7BJ2uv83fDLvrtwq
	ieBsuA1pb5k83zf5WRMiyJAFkf+Na5M7QyoVYI7DYyI2ogL/p/asuB0uu5TnLND1TORZWK/Ga6I
	2EZJfHwZWFjKoBN7ml8BrL7eMni/tpcTGuFwYRc+rpDeb1PvKC685ql5SedzpgGgBr8P8DRR3Q=
	=
X-Received: by 2002:a17:902:fc8e:b0:234:ba37:879e with SMTP id d9443c01a7336-242470303bamr41467375ad.38.1754131611049;
        Sat, 02 Aug 2025 03:46:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLwR9rioVyUrmk/rF1nliqUrzSmVHpQ7zLjekc8de488+SnZLb8YNK7ixGX6uzGj+rJA4kMg==
X-Received: by 2002:a17:902:fc8e:b0:234:ba37:879e with SMTP id d9443c01a7336-242470303bamr41467215ad.38.1754131610563;
        Sat, 02 Aug 2025 03:46:50 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b6a9sm64486715ad.134.2025.08.02.03.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Aug 2025 03:46:50 -0700 (PDT)
Message-ID: <945330e0-b5a8-46de-9825-d4663c7c2564@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 16:16:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL]: Add QDU100 firmware image files required for booting.
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <bbb85980-08a1-4413-bc14-7154583cf258@oss.qualcomm.com>
 <vqbfvneyemeofyixydra43ylmd22bbcxdsxvd5bm4mb5z24rb5@rzmmo7ipxsur>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <vqbfvneyemeofyixydra43ylmd22bbcxdsxvd5bm4mb5z24rb5@rzmmo7ipxsur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA5MSBTYWx0ZWRfX/sYyeEOA9O0C
 RiQJwGr4f7yCx2zhFM8aoGw6mbZ0PeY0ScHSat6FUulXL5N24N5Kgw0FTyhwXrkJ2a9SQN+JsDO
 2YkTi4BGZgg3Apjq+e1QWMOKyPls+uKeQe2ot6rZ9abvV7l4QAkGuIfLcUTxm7pUbfDVyqIhaWV
 7voMrU9QYjO5GuqTeevvLN2+ImohbK6Y7Gl0vhauqqffrWLb58R1PIR1OGxqMOfKsxLpimxrRzh
 eIQbTt+kPX4rgKxCyK0O/5FuEv7TcJ00CILnnwd6Kfj97yjw/U40EN7nDq7XaWukK/JtrdSHDnG
 q4gHwOEdDRgc4wHBUu1vdI/qqb1GB/4f1MxN9a6CC/y1xxa317owFswAyl1oHW1uj7WzXTKmv/p
 a0oAHCnU7Q0nCM3M/7uaQeFWPPZwOP7Xc6vQN/KGDdyVgxgXPtZbjYufXY2Ud5GqDrLasQwG
X-Proofpoint-GUID: c8xV7Y68iq78KH99NPiwK3erbBjJUli5
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=688deca7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=gXYLO4WO7Ryw2KCPcSMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: c8xV7Y68iq78KH99NPiwK3erbBjJUli5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020091


On 8/2/2025 4:15 PM, Dmitry Baryshkov wrote:
> On Sat, Aug 02, 2025 at 03:51:11PM +0530, Kishore Batta wrote:
>> The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8:
>>
>>    Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22
>> +0000)
>>
>> are available in the Git repository at:
>>
>> https://github.com/kishorebatta-ossqcom/linux-firmware.git qdu100_firmware
>>
>> for you to fetch changes up to dcec874b15615bdde99acb9f2d39572eb14f4c24:
>>
>>    qcom: Add QDU100 firmware image files required for booting. (2025-08-02
>> 15:39:06 +0530)
> Are these files required for each boot of the QDU100 device or are they
> being programmed to the target and not required for consequent boots?
These files are required for each boot of the QDU100 device.
>
>> ----------------------------------------------------------------
>> Kishore Batta (1):
>>        qcom: Add QDU100 firmware image files required for booting.
>>
>>   WHENCE                          |  21 +++++++++++++++++++++
>>   qcom/qdu100/abl_userdebug.elf   | Bin 0 -> 212792 bytes
>>   qcom/qdu100/aop.mbn             | Bin 0 -> 510944 bytes
>>   qcom/qdu100/aop_devcfg.mbn      | Bin 0 -> 12136 bytes
>>   qcom/qdu100/cpucp.elf           | Bin 0 -> 68576 bytes
>>   qcom/qdu100/efs1.bin            | Bin 0 -> 512 bytes
>>   qcom/qdu100/efs2.bin            | Bin 0 -> 512 bytes
>>   qcom/qdu100/efs3.bin            | Bin 0 -> 512 bytes
>>   qcom/qdu100/fw_csm_gsi_3.0.elf  | Bin 0 -> 20328 bytes
>>   qcom/qdu100/hypvm.mbn           | Bin 0 -> 1358672 bytes
>>   qcom/qdu100/kernel_boot.elf     | Bin 0 -> 49004344 bytes
>>   qcom/qdu100/mdmddr.mbn          | Bin 0 -> 81960 bytes
>>   qcom/qdu100/multi_image.mbn     | Bin 0 -> 12088 bytes
>>   qcom/qdu100/multi_image_qti.mbn | Bin 0 -> 12088 bytes
>>   qcom/qdu100/qdsp6sw_dtbs.elf    | Bin 0 -> 7992 bytes
>>   qcom/qdu100/qupv3fw.elf         | Bin 0 -> 56432 bytes
>>   qcom/qdu100/shrm.elf            | Bin 0 -> 82428 bytes
>>   qcom/qdu100/tz.mbn              | Bin 0 -> 3186640 bytes
>>   qcom/qdu100/uefi.elf            | Bin 0 -> 2666296 bytes
>>   qcom/qdu100/xbl_config.elf      | Bin 0 -> 225368 bytes
>>   qcom/qdu100/xbl_ramdump.elf     | Bin 0 -> 749464 bytes
>>   qcom/qdu100/xbl_s.melf          | Bin 1424292 -> 1444772 bytes
>>   qcom/qdu100/zeros_1sector.bin   | Bin 0 -> 512 bytes
>>   23 files changed, 21 insertions(+)
>>   create mode 100644 qcom/qdu100/abl_userdebug.elf
>>   create mode 100644 qcom/qdu100/aop.mbn
>>   create mode 100644 qcom/qdu100/aop_devcfg.mbn
>>   create mode 100644 qcom/qdu100/cpucp.elf
>>   create mode 100644 qcom/qdu100/efs1.bin
>>   create mode 100644 qcom/qdu100/efs2.bin
>>   create mode 100644 qcom/qdu100/efs3.bin
>>   create mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
>>   create mode 100644 qcom/qdu100/hypvm.mbn
>>   create mode 100644 qcom/qdu100/kernel_boot.elf
>>   create mode 100644 qcom/qdu100/mdmddr.mbn
>>   create mode 100644 qcom/qdu100/multi_image.mbn
>>   create mode 100644 qcom/qdu100/multi_image_qti.mbn
>>   create mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
>>   create mode 100644 qcom/qdu100/qupv3fw.elf
>>   create mode 100644 qcom/qdu100/shrm.elf
>>   create mode 100644 qcom/qdu100/tz.mbn
>>   create mode 100644 qcom/qdu100/uefi.elf
>>   create mode 100644 qcom/qdu100/xbl_config.elf
>>   create mode 100644 qcom/qdu100/xbl_ramdump.elf
>>   create mode 100644 qcom/qdu100/zeros_1sector.bin
