Return-Path: <SRS0=3wck=6E=oss.qualcomm.com=yushan.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81408CFD376
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Nov 2025 09:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D610C116B1; Fri, 28 Nov 2025 09:56:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64549C113D0
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64549C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PWcf3797333
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0072dSXnDvM30E3pPWRlPMgef3oFsY5+okFjq2nU+nQ=; b=AmdPa7NEyiFivrNy
	78DRuY04vhSztck5jGpWyajY2Au+n0/jGxuNzgrVI76ogYz1Ssb9OLb+9h0+kYG0
	ay5q5Yzlr3SvunJMx+EFnp+ibkUZmOOkEBou0SNhwi3lZf+20xGFXCuEYEZ02w3p
	w5UeGgsEc7qqucdACJZRogsLbkY3j0GFdppzAPJpe0r45o+J5k2+AL+tEGOlEyP6
	agBo+zW7f9Zm/DrICD1leRgfgcUuwOhembDgoPtc0RqeO5mOW1/QST8xdcLu4gBZ
	TZXjU6/MVXG5jvULBkkWAt+wZvSOvVkSppPShc8goqmeQUe0bJJxxQdx/9bc/FwN
	PpxUEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnudaqrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:56:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e1cf9aedso28708445ad.2
        for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 01:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764323787; x=1764928587; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0072dSXnDvM30E3pPWRlPMgef3oFsY5+okFjq2nU+nQ=;
        b=GHaVc08553YEIAUG4v+H3crlm37eDHdf5nBRtmbXWJenkjzfs4JLiB0D9irOt5oQsr
         gZEj5yI2TYtC/RYXC5O0tKNa+i5Q3hfIX8yc13+na4P+UriacVdzCbxQ94ELkcI/G/Vv
         CvOe40jQapV3XOKYQRclSgB2y+PF1m6fxatjaG6ovgzr939fjbesw9l0bCfYPPhwfjgq
         J3HPZirOOq5NMoymgYVEA6m8mGMvAtG8t+aAHggVJHHO4LQFLIUp44y2nzlyc+/YMGcB
         NtwplcME53/CXdrfp5zifWF+pFDqUWl3Ud+SyNi8KTV7+/1X/RK+UnSIfQD9kkYSwltB
         gKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764323787; x=1764928587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0072dSXnDvM30E3pPWRlPMgef3oFsY5+okFjq2nU+nQ=;
        b=qekeV8Kvk1u4BkUTj8lu7uyY8mEHr5jYxCzRsBKS/Gcx+E+3MLATJQv+5NVvNploRp
         RVH7lF1NoWZ+4W1cZPZHKvZ97re7cu9AJRRJBhOgpbPbtbt+pS1qLJiP+lvxc6ietkvb
         CE/Er14C5oBT9F79/iCcQ9XkeXm/dbg9OijgzmgKn+1Opg7N6WIFYDivx8iLrW2Cd68N
         k9lgw4mDk36ZaEBdptnC1sbzCM4SvyqnrJ2Eh99FdFZqZA0g5iich3pHbiszeiIfNJcz
         1M/YB/Im4JZzO27WrVe8ZwH0lHa7abdvNFKfT7iMRIOSv9OYt9pZPop8C2+Wo2M4B7Du
         YIHw==
X-Gm-Message-State: AOJu0YzaYF/gmMN/Rhz3oaehRL9BzG95An271hD6sKpis6QbF4xqEcG1
	rmXbTxY7+ZI3eJLVN7Ifb9+7Bstq/OykZUMB94+E1RUxAQvJ+MCn4LRNRD5fn31HmGC2TtY35LH
	LpcLRP1MU/mqwA0oMsCp05ph7ny/iTGk45+7SC7lVeVarQDqMa64ZEl2SATY4OfPjIZNa8YY=
X-Gm-Gg: ASbGncu4MX/svryfND2Nk8kjJ1RQidFdz65kcj+bQPteqAiE9vvvBSbeY1RuJmq8G4y
	R9o+cNcTtMrADklYWABwWoV4p/kBxBgnUeGm8VGvzKeCOiX4F43kZ7aDg3jYWSMiGlQNZVOnqzm
	iGRFV8MInlMMeLNkLKyKI9l7eb4wWssB020id/0vU7vF7xCHStlE3b1Wd+CS8Dw1WBw3uuIywpb
	fTxuipGh0SAUjOgcl/Ph9c8tlVx0CwpjoOXF+McCw45ishPxpbaMfKbzT1ClChOWdiNvI7MAmGB
	9yFrK9obb32FDu0OFvmJVzXHHCn7BTAQafi+xzKBBfBv2TXRQe1oM90YpJU3mQ9g7sisxdZJjdl
	FWzJ40bjFr8rtRSucIKJSm+fcMs+j9YMthwDMzWVejShPFv9ul/h3CAYNIasbhN3uSqAJDK35+k
	Dq
X-Received: by 2002:a17:903:947:b0:28e:a70f:e879 with SMTP id d9443c01a7336-29b6be8cb2dmr297473505ad.1.1764323786849;
        Fri, 28 Nov 2025 01:56:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoXHZCaOIwGMKjRH3LXqeTCndWXImEnz5yvufXV+7brgYqY4Z3g2siMtTjeoqagxUHr97Ikg==
X-Received: by 2002:a17:903:947:b0:28e:a70f:e879 with SMTP id d9443c01a7336-29b6be8cb2dmr297473215ad.1.1764323786379;
        Fri, 28 Nov 2025 01:56:26 -0800 (PST)
Received: from [10.133.33.47] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ab81sm41063495ad.3.2025.11.28.01.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 01:56:25 -0800 (PST)
Message-ID: <991d4fa5-e608-450d-94e9-cc7618f53c25@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 17:56:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update ADSP firmware for x1e80100 platform, change the
 license
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <aeb95be6-2e42-4f0c-a34d-a6453790819b@oss.qualcomm.com>
 <a4pblzvdt6xngwfp7irvaap4bebdm2rt3dgm4dq5l3dexaw6tn@os6ymb3ytmub>
Content-Language: en-US
From: Yushan Li <yushan.li@oss.qualcomm.com>
In-Reply-To: <a4pblzvdt6xngwfp7irvaap4bebdm2rt3dgm4dq5l3dexaw6tn@os6ymb3ytmub>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2uoxEmuKPu32-0Sv-3MUrm0Uo0qNwXn9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3MSBTYWx0ZWRfX4NZpdlKvPx/m
 K/Bnk1zVWXJHd5t/3qgNU7hrWkYgFdDOpYaMpNc8M4H8fAWtNlre86tBjKfCKUtJwVQHJpbSyxs
 Z9eWLBmqYvGxwUb5zzMwL91pqYcyAOzd1qxaaxqWbr+OBekrlLi3OCwqzs2yTvC/nhqhCUSOf2T
 h1jeowTaewgCH90rrhaOYejIAXOnF/1o5+L8i646A3/FkeDI76V6XlpExszndf1Pj4jRG/WNT7B
 0qovvzIAJbbyYYvdQVY0GN5ZgQdX7HAo1g29/7RhLBokWSIiiDdJ/dj7DIBKC7ZE9OxJkAb+UD/
 p0w0pVlnUcybsdXMs5LDA7SXrAWtc5jo4QqtLcREK013kmnAnsDUvEUCbZzBETSn6HrjTUGk3Uh
 n6ctSoKPBCo0jN7R6YM9ic+VXy/EWw==
X-Proofpoint-ORIG-GUID: 2uoxEmuKPu32-0Sv-3MUrm0Uo0qNwXn9
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=692971cc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=k7afjhX8tGcU392RkqQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280071


On 11/28/2025 5:34 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 28, 2025 at 05:14:39PM +0800, Yushan Li wrote:
>> The following changes since commit 14d4b18b066788070c382a5ff7bfdce17ee3313e:
>>
>>    Merge branch 'robot/pr-0-1764146897' into 'main' (2025-11-26 09:08:47
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> x1e80100-adsp-1126
>>
>> for you to fetch changes up to 818809855970fbaf8055aff5a91a133ea5feed49:
>>
>>    qcom: update ADSP firmware for x1e80100 platform, change the license
>> (2025-11-28 15:32:30 +0800)
> Why are you putting x1e80100 between sa8775p and qcs8300?

 From my understanding, we should follow alphabetical order.

However, since we have sa8775p and sm8750 here, and they’re separated by 
qcs8300,

I’m not sure which one should come next. Could you confirm if I should 
place it after sm8750?

>> ----------------------------------------------------------------
>> Yushan Li (1):
>>        qcom: update ADSP firmware for x1e80100 platform, change the license
>>
>>   WHENCE                     |  14 +++++++-------
>>   qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
>>   qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>
