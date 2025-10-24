Return-Path: <SRS0=6tLm=5B=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98746CCF9E0
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Oct 2025 23:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6404FC4CEFF; Fri, 24 Oct 2025 23:52:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80D95C4CEF1
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 23:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80D95C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9XBp004046
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 23:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PH1F0G9nW8JbaWeswJiQPxhlCoK5iyJ6cn20Qxmznwg=; b=PpqYS6g43scWRULo
	qgeGXHc//WIHu9dBQUbFvSDVu6MBkjDNkXpOMoTf7FlyRYZRN+/t/hbb1mrGEdOt
	7/XntvAO8alIEMmIFCCHvM+9E9VwMKYAwGn5/Qoz+jlRVLW96QJk4ff/1nHHuqTB
	iSv/1gfHg3xgLG09HP9AWUdsYiTeBWGR3XrCpQAofZ72n99CG06RggwLhzYT4lMh
	6bDIu2Z2G379gq0jnqDrAh5NP+d1qrdn0AtC40qaBODEKqFJI0AzFJFB9FpPGfbX
	pyjMIWY/fbdygT4SOfUy52WgXFk/AMzwPW9DJnsK8M9GLZWF/skPaUoEkwKga9TQ
	a1/bbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524fqnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 23:52:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8bb155690so38928811cf.0
        for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 16:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761349938; x=1761954738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PH1F0G9nW8JbaWeswJiQPxhlCoK5iyJ6cn20Qxmznwg=;
        b=dDObaScmY52L0ar70CTr2DEv0HMxj5TPGFaUyfIfjAmMiRFIqUD1i4J+3k4q5Up7Wl
         gkS4qYLErovzWqJwXXc5WAgiMzl5XZ8lJ/WBJfSD6JlWLn5XjM0gRy3blLj2PpsctjKz
         0w8vU8tF7r7OfE74TpAfT1HwRyi9ESjYjQcYJRrnck1vhZFdJTh4CZvZaW+zaeWTW0y1
         S3GVQIpwqbIk7qThTfEPgOLvvWxIJtSDq2phgcU2jodCsvSowHXjPmeLF3MxEsFj/zAf
         817C/KgQZxcG1bPeKxVsYEllUKM1iN7VuOcUgwbU0XhhjQvNSt9oO4bFzhjEGEhF1zjD
         szpQ==
X-Gm-Message-State: AOJu0YwceFb3xCvxKZ9Bmea56iHnAYPi+qddAjyXQpqwK4qzgRBa/iF1
	Rc4acjV8Sqxgaj1IY4Me1nuhkf5NELLq2oUNl8J0DkL1zpJaX3xgZrw57M/Lw3BSbEiTYA62RWX
	A2eg6m+2xaCfn5XH+VbjZ5szy9yFF/Jhx9Bc5EQhKk8TZenp8QFawderxmCB14ec=
X-Gm-Gg: ASbGnctBj34r6diPgqqrkEnWs7kwkZIgQWa+17O7WYJa/0XGMpHALg8lAjGmQIzZjgk
	RGA4/4jhhT6gvO4dkxCx+Kn0xEjriNul1b1V2Dasw+4t1T97naeW1qPKge9R7VY2cAT1snk4U2t
	HD4yYJKpuXu3XgS/DegsbVbVXHuEBK5zoUjFJvtHg+QMmtScF0Fh7xs/awwHurB7Knh+pz6iCwn
	pNI45XceqRxHvZClxtbaHX9yXqluKzcDnBsEz7BRkkRdvxjPa7pJMfbUVROKzUcU8Z4yslag5yU
	dw0rYFoTU4xjdnn18qZim0g3OZC2SqOK0IZ7sI2/X2rcoXsnKuzh33UHNOdCRPx8VSuR82Pr94b
	+5z9hKFjOBXxFxinkI/R4gZGoecE+xsEeajE//9QhKmjwwIopDAZ3lApSDcC4REFvfmwuKMROzl
	oNLQximHXjC3pJDXqUGUPbLoGYvTrTLSH6
X-Received: by 2002:a05:622a:11c4:b0:4e5:8352:9db2 with SMTP id d75a77b69052e-4e89d3f3eb9mr380652011cf.74.1761349938233;
        Fri, 24 Oct 2025 16:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzCxedrQMIDUwtXoQX6CY0k5rOHeQe5M7U36OEc4mtpSJkbSKvCyj7LkMMzEFQpOOri7Y94w==
X-Received: by 2002:a05:622a:11c4:b0:4e5:8352:9db2 with SMTP id d75a77b69052e-4e89d3f3eb9mr380651841cf.74.1761349937758;
        Fri, 24 Oct 2025 16:52:17 -0700 (PDT)
Received: from ?IPV6:2001:999:78a:6bdb:4a04:8470:a7e2:a09b? (n858d08qopcovr0eljv-1.v6.elisa-mobile.fi. [2001:999:78a:6bdb:4a04:8470:a7e2:a09b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41d14sm151587e87.9.2025.10.24.16.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 16:52:16 -0700 (PDT)
Message-ID: <b3a1d843-6e64-4573-8afd-edb10ab8e86e@oss.qualcomm.com>
Date: Sat, 25 Oct 2025 02:52:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL]: Revert QDU100 firmware binaries
To: Josh Boyer <jwboyer@kernel.org>,
        Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <9d96eedd-c1de-488e-ac5a-d515d8d3563b@oss.qualcomm.com>
 <76de8198-d219-443c-9283-2811ab338c17@oss.qualcomm.com>
 <CA+5PVA5sjP5a9Jr3=5E5vM=jGP3JcA5ELKLuxd4JSVzG8avKdg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CA+5PVA5sjP5a9Jr3=5E5vM=jGP3JcA5ELKLuxd4JSVzG8avKdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX3edEpEYxxWY4
 PQJtgEbuuKLWNjeQdUiQEhyup9POsfXWBrLSaT1Cw7EMb63hQNu8Y/2WrBetnKUkxS/vEUXagUi
 lrTTGAb9bRBHwy9Buypp0wWeiXYL8SF7O+GkMkhafkiSLlT/G34UT+4oWst4+WSwufWBnGGK/XD
 4bgKMEXvlLK3+Bk//RpS3kW+F8ErxfJoFmwSTd4hAL7mWqfbm36OKel77xX0Dn7F4g/vOgEojc2
 U9UQBo/pFYYZj5P+wfwRHw1K+ATtoymsham6i9JomvAqFSEfcOjUFqJKM4twsRcw7yJXpZ/ZWfL
 lHZArAnSpiUng8XkoJpWSQaarUd5TWF5tyW5+pzXgUpYkcB7NirrSw0urHnsOMVYlGcX9TF7seQ
 /QkV60LmZlS1JasoPmY2NfJKZkkJbg==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fc1133 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=2c9enmtGz_obDoCi5SYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: jKSkY0_7QAtbbzxGsR83TIrUP-Pbx5IK
X-Proofpoint-ORIG-GUID: jKSkY0_7QAtbbzxGsR83TIrUP-Pbx5IK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On 24/10/2025 19:24, Josh Boyer wrote:
> On Fri, Oct 24, 2025 at 5:49 AM Kishore Batta
> <kishore.batta@oss.qualcomm.com> wrote:
>>
>> Hi,
>>
>> This is an updated pull request to reflect a corrected commit message.
>>
>> The following changes since commit 19731a36222e7b1ca09be090a19bfd89640a837f:
>>
>>     Merge branch 'HP_Linux_Firmware_20251023' into 'main' (2025-10-23
>> 13:30:10 +0000)
>>
>> are available in the Git repository at:
>>
>>     https://github.com/kishorebatta-ossqcom/del_linux_firmware.git
>> del_firmware
> 
> We can merge this, but the firmware is already released and included
> in a number of distributions.  Deleting it in the upstream repo isn't
> going to remediate the license situation.
> 
> Which platforms is this going to break and how will it show up to the user?
It will only break the QDU100 platform. I don't know the spread of the 
device, but it is a 5G RAN platform, so it'd not a widespread device.

Nevertheless, I don't think that just deleting the firmware is a proper 
solution for the situation.

-- 
With best wishes
Dmitry
