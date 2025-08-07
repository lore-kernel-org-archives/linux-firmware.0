Return-Path: <SRS0=AQAR=2T=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEC5C87FCA
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Aug 2025 11:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60542C4CEF1; Thu,  7 Aug 2025 11:55:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BFB3C4CEEB
	for <linux-firmware@kernel.org>; Thu,  7 Aug 2025 11:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BFB3C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779CxiF032628
	for <linux-firmware@kernel.org>; Thu, 7 Aug 2025 11:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rGtMEtVrNXhtnxPZ4djfUM
	gnGFM0jcaE0KgJ5+NTCf8=; b=mVvI7v+l220DfAupLf9nLNMx714WOVslumxG9U
	Pqs1v+DRit7DHKyh79ubbk4GgIYHuAFOlVzOZnbYybd4mnolAHBC/pH5ZQieRDqd
	bnhqMlCRqg0+vBgkUfR6OcRR7adyn0t3UT1oHWZ6lx2MbAfZBmnOXazbcyDKKsv4
	4A+v8ogD8JV4DU3LCe24csJhFXXX07+YD0uhGbq905ovbGavbbgS/f8wyZ1diOQx
	DZ6f0BuVHZVw3eqtCOzztWr6lCI9wljDVWFoMtaiNoBLA5IeyYYX/73Bz0DnYPg0
	n3va4vAErtAjYpbpTdbtTpLZHWUJ1VlkZ588688HtmZ2CH1w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw364sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 07 Aug 2025 11:55:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24086faa5bcso8443385ad.0
        for <linux-firmware@kernel.org>; Thu, 07 Aug 2025 04:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754567699; x=1755172499;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rGtMEtVrNXhtnxPZ4djfUMgnGFM0jcaE0KgJ5+NTCf8=;
        b=iGxA08sn5iBDDXX/OGp7vuoNsHAD0iiaViL2IgtOERIkxqYvjFDwWyabLkbnqeoQ0D
         K/hWQCy/ZmnpFqGNRi/FdS5RqmkeEzHZxR95sJaTIb3Xlv0xtzKqBQCG9Or/s8DKCC0Q
         26QFvq5fY0HhSonYMpmkSbCK++sCZO+Yr+IiuO6jBGC/0+o8La7bd0zAFaPhqJaf7/Cr
         SWAGj/uc+dRjpblj/caqufY7r/4WotszbX4YtveoSEr+oN3G3wkTa38QaZcy3TBlN4Ch
         fWbqatds7xdWQnXbhCRA67LGsJDCcbh57TUfy20bNvkuKhP5xNZx0JyKOraz3qNWjfuW
         8c2g==
X-Gm-Message-State: AOJu0Yz82XXzinyCVcfh/p5TO4SnHfFfsPmx+KLxR6X5Kuqbf/rYS07z
	PvroNyAn0lMh8trrmntxqylhc9Ir+QGTuwA6bNUkKksSpjRr/WgbGKY95LL+J99QgpDNOpV8FQU
	CtXCFTLnu9bbCOMDqeqEcq6eYxhWZVex9zJvGevpoUPZ75B0UJTBxEbW6wPbLHPid2jnKZ5Q=
X-Gm-Gg: ASbGncs5+58OdnXTUZ9Q3vp3S/oOKGzqOQt7+j3sX60WbpQvWNglRS99+Tl2iG4OUoO
	cRgLpdTIF2aKKdiiXW7UX76MomRlz4y/NXFUyoIIUxxFIZpQRz/UZTXRTmVGHdqrSeICXFMNAjT
	yhe4uGZpA5QT7SvIxFtRmkOjxKUTJhepBG9CpMZ9C5CDmcyhvoNefzCs2P/vSRKH0dvYLxFBhan
	DkevOT0udNH9dzOXdiW7qmTKg2nMCdRsiL0lF0RZrgl0kry97n4cQOsZOTlZWj9Rpencct2c987
	t5MnO6fYZj1MKG1AkF/Dlg8aA6+fjBXTQ6pzty6BY9L4dO2/9SCi06/Xm5MsD6+WJg3uErc=
X-Received: by 2002:a17:903:2b06:b0:23f:cf96:3072 with SMTP id d9443c01a7336-242b1a652d8mr41423635ad.26.1754567698797;
        Thu, 07 Aug 2025 04:54:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK9qr/GYni6YFRIMzYdhb9hKV1oqGNwp6b7Dm4i4J5tyk2d8DRobiD1IGAE9jk95rznNPpRg==
X-Received: by 2002:a17:903:2b06:b0:23f:cf96:3072 with SMTP id d9443c01a7336-242b1a652d8mr41423345ad.26.1754567698369;
        Thu, 07 Aug 2025 04:54:58 -0700 (PDT)
Received: from [10.217.218.60] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e757sm184225835ad.55.2025.08.07.04.54.57
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:54:58 -0700 (PDT)
Message-ID: <3afa5092-f650-4e97-a20f-71be81735b69@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 17:24:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PULL]: Update xbl_config firmware file for QDU100
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXwyBmHpP2xkF0
 8m2te3Yd6zboesfwgl7qm7ZwoEdI5gyosSJffis96Y8pK2eTNczHK/ERFFTwsU8opUfI3DEmQ+W
 m51N+Fz0MD+e+eb5mVRU1p18eVQ30NZVq5tfLab2MflOt0A+2LScQUGdqdaPP/QsVdKQFjW6FFf
 1BmLRQy4AMXBlNC4bnHTTQJBH8yMt4BlsTYvsz427+iwaWC7mYkUAqZlw+MUDAQA/EUGdtV+1Uu
 kheVA/RdSUc3dyYe97WvjtrVx6Gut3oaIHCVR+fcQjbTRgbVyJt+PhjiQ5NJzRxNNuPXlTItrdx
 RW6QneUUIMe35Wngp0zIK57MUcIK16wzK36N2X8LPHNU9rWi5zCSNwFCFKGpqaR6A9//B7YFVdr
 x4JZS3kz
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=68949414 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=mvL5A56u23TjM-_zZg0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: N5pV3GGkAg81yuLHbQ47UyJaqB2DVLW-
X-Proofpoint-ORIG-GUID: N5pV3GGkAg81yuLHbQ47UyJaqB2DVLW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

The following changes since commit b6b0b15278c76bbc1b7aaf17e706734d4be28e00:

   Merge branch 'amd-staging' into 'main' (2025-08-05 13:39:15 +0000)

are available in the Git repository at:

   https://github.com/kishorebatta-ossqcom/linux-firmware.git 
update_xbl_config

for you to fetch changes up to 9188b156478e5d4a3fa455d9e0b588b4859c4a26:

   qcom: Update xbl_config firmware file. (2025-08-07 17:16:52 +0530)

----------------------------------------------------------------
Kishore Batta (1):
       qcom: Update xbl_config firmware file.

  qcom/qdu100/xbl_config.elf | Bin 225368 -> 225368 bytes

