Return-Path: <SRS0=mf8c=XI=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36925C369D7
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Apr 2025 13:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC79DC4CEEF; Tue, 22 Apr 2025 13:22:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89156C4CEEA
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 13:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89156C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCiIf3023515
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ywwo4J/F0eoRmSVHss9rlz
	/4wyLr3pdcuegvS3fjwsM=; b=d8AX/k2ZviwmDZ/hUb7sid0k+bY7n4BHYIUULe
	FDH5upi3S88k4fcj3R5CRi/tiT828XL0goA1sMy9raQxAKh0CO6UTxEWCs2MK4w8
	Gphv9z0UIlAKZD4sz2kopV9pTV5oQgpKDyIOo2FZmgLeiyhPPym0CgxzgHKl7m47
	+UafVKi8C6tAuJeHbVbPamS34YETVEEYeFsBefrV7CWqFNONVHiF/oF3Haoxh+7q
	HJH/BxsIGW7O9hsT4KGoyRM/vsUbXNv4Cbk6Bkj2a8rswv7gM6XpeJgu0JB9W787
	FNspkEmvY9z6yc7YAs4ss8aEgpInOaXG83ADvWGmGV3j/9mg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwqpay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 13:22:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2b4ab462cso46114496d6.3
        for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 06:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328156; x=1745932956;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ywwo4J/F0eoRmSVHss9rlz/4wyLr3pdcuegvS3fjwsM=;
        b=URtDjVnUFOM28k492tDIG8R1+nPqjLk988Ibs9c6UOgs1ozN+PLFZu+ZmHIbtlFLe4
         pbWRUbYfbpDiyjUP8u/AyOzVNaKZFExLns8ZSpogiwFO2ATXVDjK2RlO3rM9t5vIfjjr
         RYeDfLErKdEuXTMlPUnkqye72ZOz1B4B7FAC1xCJin1He4AsPSY/l7CUFB41BNUrE2fo
         ft+MviOGQwX4rzr8D3DIe18RlYJBeOJ9DRz+AgMic6ODCp57nYctCxgh3V7wD5ioSOV9
         MEaG7LVysq5PrYD+bpa84W8wdeG40eOkLSYAyBbJq8ItEWgoqgZojKgJoOP8kGJFfoe6
         WEmQ==
X-Gm-Message-State: AOJu0Yz4StEqUsl2EfrWAlV4kySC0tEgRwFqAtS0kakHgAW2PqLnwzdI
	p8jKmrAGHIR87jYg5a9NZ8T2v1Mx97TEHvFz+okdJiFHNFjdiF4NDd9Ki80NkEziqRyNoOQqTfJ
	fPxISq7mQ441As/LoHdecgtFMRvquokNwcOEA+Cv+8oQzl54ZxFhcKMDXibwRPgOb4OM=
X-Gm-Gg: ASbGnct700RB0K8AbE60BBC4JqYu8/IPZyox3AXqoc8fgaVMaJhV8/JCu+ONXFzHYsK
	rrXXI5tgZX3h+S9/eaVSZDTRJt+HPO7MBDcbiFcif5+xmtqP2p9/9iQYmqCnrp4e8P2JWziwp9v
	p2bbwxsH9GHyCIfhVs/U97hXwCBOOz8wCZ0jIWBQTYRHJFAH+I2oup95R5EhiI1VkQsliM8xI3D
	OaxeRTVt5ZZa4U0fBcIv+MBUILIFFMe9JoSjgXNV1PdKBGMkhvzQNBJ4mD+OPeRD9x1dJ4QfoG9
	FSqjCTzxnFDt5opgYT++zV0leoVVZ6fet06mnsNrcLa8aoFvJmEHGY2mLpWMOFhh1QrGeAG7B2h
	GFQgXxgR0XTw7mMP7VJFGN33Om8WB+i0gVguUO3rzFhmhn2OadoczwPrVEsdAusEh
X-Received: by 2002:a05:6214:20e1:b0:6e8:f2ec:4932 with SMTP id 6a1803df08f44-6f2c46423cdmr286315856d6.28.1745328156606;
        Tue, 22 Apr 2025 06:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtR6d+LyNNhLVr3KrOGMcrFQu14dyhuYQG2ctj8nDEKm4kUd4vDZuNiolpY5oxXlQkeVIDzQ==
X-Received: by 2002:a05:6214:20e1:b0:6e8:f2ec:4932 with SMTP id 6a1803df08f44-6f2c46423cdmr286315516d6.28.1745328156266;
        Tue, 22 Apr 2025 06:22:36 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c7:3460:8c92:e9f2:d357:6a96? (2001-14bb-c7-3460-8c92-e9f2-d357-6a96.rev.dnainternet.fi. [2001:14bb:c7:3460:8c92:e9f2:d357:6a96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cf9ecsm1219263e87.156.2025.04.22.06.22.32
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:22:34 -0700 (PDT)
Message-ID: <e4c6c159-7824-4fa9-b7b2-5f36c97ef6c2@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 16:22:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Firmware point releases / LTS branches
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6807981d cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=H0-evf2-M9NCU-NHwSAA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 2JsBUWM5ec4SHUWohzMOhtkbHUvsiLbl
X-Proofpoint-ORIG-GUID: 2JsBUWM5ec4SHUWohzMOhtkbHUvsiLbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220100

Hello,

Up to now we have been having a single stream of linux-firmware 
releases. One of my colleagues has raised a question of providing 
bugfixes for the firmware. In other words, what should be our course of 
actions (and should be our recommendations to the distributions if we 
want to provide a bugfix or a security fix for the binary that was a 
part of one of the previous linux-firmware releases?

Usually we can not recommend e.g. Debian to just bump up to the next 
release. By requiring them to backport necessary binary patches might be 
a bit of a burden.

Would it make sense to handle a coordinated point branch release at 
certain point(s) through the year?

-- 
With best wishes
Dmitry

