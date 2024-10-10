Return-Path: <SRS0=xjV6=RG=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D5FCF11C6
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 10:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBE38C4CEC6; Thu, 10 Oct 2024 10:18:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD48EC4CEC5;
	Thu, 10 Oct 2024 10:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD48EC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1b7cK027147;
	Thu, 10 Oct 2024 10:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPtiAa0/GnKtSA0kBM5+53ggTtoMyYY5JVLLcU0gZBY=; b=kc+w3eHCBn+92KIh
	VuHhXWWcSJAS98oz232/M1V47QdQob8FrjCQRP44v+3q8ByfBG3m7L+tN05wGahG
	j+g05Te82MMZtmEmPEM5PCvnx+vgbOcJ2unM6C2iTA5IunN3S4PnhvR6L7Lq7ZXx
	XpyqCOMg6KIpsbfPpRft01yF3U81rpGRyq0EsbZ6m5SaqzKlEOxlEnuZvOrqxGgI
	Az6xWpp4mQ3hlyB9dB0L8zELxB1EcVLDfVVmjce5IYKT7/Dg7GbKE5LxB+0D2FlO
	Hky60gLMHeP6riM0OVZ3CgleA5TsuqwPrr3fQJkZrQYc7fAS6nUAoIVpXHUOQUBw
	nNn14A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qwffx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:18:49 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AAImvZ005779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:18:48 GMT
Received: from [10.253.73.226] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 03:18:47 -0700
Message-ID: <0375ab16-8f0a-4520-9073-13dfea660f30@quicinc.com>
Date: Thu, 10 Oct 2024 18:18:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmwares for WCN785x with UART
 transport
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
References: <17161839-07cf-4167-be99-220ff23b17bc@quicinc.com>
 <sawsdn6kvjymvocnrb2t27o6qcuj2lpctv465plzfq7io7f23u@nmck7rrgvdbu>
Content-Language: en-US
From: quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <sawsdn6kvjymvocnrb2t27o6qcuj2lpctv465plzfq7io7f23u@nmck7rrgvdbu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UtZiGItrOMn0BQk9DNxfEI60w0Ydrwsw
X-Proofpoint-ORIG-GUID: UtZiGItrOMn0BQk9DNxfEI60w0Ydrwsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100068

On 10/10/2024 6:00 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 09, 2024 at 04:30:34PM GMT, quic_zijuhu wrote:
>> Hi linux-firmware maintainers,
>>
>> Here's a pull request for btqca bluetooth driver. Please let me know if
>> you have any problems.
>>
>> The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213cf:
>>
>>   Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)
>>
>> are available in the git repository at:
>>
>>   https://github.com/zijun-hu/qca_btfw
>>
>> for you to fetch changes up to 2a8ffa36567f300041c6d6d509b897a4fcc42916:
>>
>>   QCA: Add Bluetooth firmwares for WCN785x with UART transport
>> (2024-10-09 16:01:30 +0800)
>>
>> ----------------------------------------------------------------
>> Zijun Hu (1):
>>       QCA: Add Bluetooth firmwares for WCN785x with UART transport
> 
> Could you please confirm that the licence for these files is
> LICENSE.qcom rather than the typical LICENSE.QualcommAtheros_ath10k ?
> 

Confirmed that it is LICENSE.qcom

> 

