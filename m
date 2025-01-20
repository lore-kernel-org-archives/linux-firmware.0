Return-Path: <SRS0=n3hk=UM=quicinc.com=quic_vivesahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F7FC02185
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Jan 2025 09:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D549C4CEE0; Mon, 20 Jan 2025 09:19:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3628BC4CEDD
	for <linux-firmware@kernel.org>; Mon, 20 Jan 2025 09:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3628BC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K3fmOj002459;
	Mon, 20 Jan 2025 09:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OB1kmuN6AXqHkIhEgS0Xsp+l
	zkCZEwRuShuFxxuOSck=; b=dBzAscPmztJUYwbTYgt//+QOqmKXjPDWjx62EAQf
	sJCJys+vd3e4dkoovW0FoOzGs2Ma9fQnENngu0HfSO85xXv7pBZobwc4YYBVOAAb
	5HyB73f7oo9xuw7KwIUFkQzqSMm1dFlY+eotncWyZzRh/Q6lNEf65aX/JOUBmA95
	NpQYE/dCX40i67Tnq5qqi1vASi6XtItCcYMj7xr5oGDYyIb3dpUC11xuU2FxbRBj
	USXBjnObXPoJn0GIMTUl1sijt5iBNAej7AGfkkQGwdnS7WvYlqsNZLMo7F2GTWXQ
	mgrUebPZIeVJpuMRZJY5UZVJ60GHS/pmHTuU2l6fhrd7gQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449etegs2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:19:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K9JVoY021681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:19:31 GMT
Received: from [10.218.12.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 01:18:56 -0800
Content-Type: multipart/alternative;
	boundary="------------RVkLVGEEsR8PP5MQQSycR2oh"
Message-ID: <d3924fae-8e5d-44bf-b882-6f18286beab8@quicinc.com>
Date: Mon, 20 Jan 2025 14:48:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Update firmware files for BT chip WCN6856
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <quic_janathot@quicinc.com>
References: <57fe5525-8383-4737-ba60-6c9c0c6997f0@quicinc.com>
 <bf08e319-07ae-4f96-92f2-aac8f1a7e136@quicinc.com>
 <2cqzso5hkp4t3m3xqrsprt52mhafm6kasjm2hol5b4te23aos2@2uwy7tkaowyv>
Content-Language: en-US
From: Vivek Sahu <quic_vivesahu@quicinc.com>
In-Reply-To: <2cqzso5hkp4t3m3xqrsprt52mhafm6kasjm2hol5b4te23aos2@2uwy7tkaowyv>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KLgUBwwW7zHKUVKM8RkXXcV1Yr7gP-Li
X-Proofpoint-GUID: KLgUBwwW7zHKUVKM8RkXXcV1Yr7gP-Li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200077

--------------RVkLVGEEsR8PP5MQQSycR2oh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dmitry,


We have created a repository 
https://github.com/vivesahu-qcom/bt_hsp_fw.git by cloning 
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/ 
<https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/>. 
Then we replaced FW files which are required to update the FW of the 
chip and created a patch and shared snapshot of the pull request in 
trailing mail.

Let me know if this makes sense and good for move ahead with the 
approval. If not please share right way of raising upstream request for 
FW patched.


Thanks,

Vivek K Sahu

On 1/17/2025 3:45 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 17, 2025 at 02:27:32PM +0530, Vivek Sahu wrote:
>> Hi Team,
>>
>> Any update on this ?
> I don't see this branch on GitHub. Did you push it in some strange way?
>
>> thanks,
>>
>> Vivek K Sahu
>>
>> On 1/13/2025 6:19 PM, Vivek Sahu wrote:
>>> Hi Team,
>>>
>>> Please include firmware bins for WCN6856.
>>>
>>> Major contributions : Bug Fixes/Stability.
>>>
>>> Snapshot of pull request is as below, let me know if anything is missing.
>>>
>>> --------------------------------------------------------------------
>>> The following changes since commit
>>> ff68bad967033e2973d3a82e5b160813b1d43488:
>>>
>>>    qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650
>>> (2025-01-10 16:33:04 +0530)
>>>
>>> are available in the Git repository at:
>>>
>>> https://github.com/vivesahu-qcom/bt_hsp_fw.git for/master
>>>
>>> for you to fetch changes up to ff68bad967033e2973d3a82e5b160813b1d43488:
>>>
>>>    qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650
>>> (2025-01-10 16:33:04 +0530)
>>>
>>> ----------------------------------------------------------------
>>>
>>>
>>> Thanks and regards,
>>>
>>> Vivek K Sahu
>>>
--------------RVkLVGEEsR8PP5MQQSycR2oh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Dmitry,</p>
    <p><br>
    </p>
    <p>We have created a repository <span style="white-space: pre-wrap"><a class="moz-txt-link-freetext" href="https://github.com/vivesahu-qcom/bt_hsp_fw.git">https://github.com/vivesahu-qcom/bt_hsp_fw.git</a> by cloning </span><span
        data-teams="true"><a
aria-label="Link https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/"
          id="menur15bi"
href="https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/"
          rel="noreferrer noopener" target="_blank"
class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext"
title="https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/">https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/</a>.
        Then we replaced FW files which are required to update the FW of
        the chip and created a patch and shared snapshot of the pull
        request in trailing mail.</span></p>
    <p><span data-teams="true">Let me know if this makes sense and good
        for move ahead with the approval. If not please share right way
        of raising upstream request for FW patched.</span></p>
    <p><span data-teams="true"><br>
      </span></p>
    <p><span data-teams="true">Thanks,</span></p>
    <p><span data-teams="true">Vivek K Sahu<br>
      </span></p>
    <div class="moz-cite-prefix">On 1/17/2025 3:45 PM, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:2cqzso5hkp4t3m3xqrsprt52mhafm6kasjm2hol5b4te23aos2@2uwy7tkaowyv">
      <pre wrap="" class="moz-quote-pre">On Fri, Jan 17, 2025 at 02:27:32PM +0530, Vivek Sahu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi Team,

Any update on this ?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't see this branch on GitHub. Did you push it in some strange way?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
thanks,

Vivek K Sahu

On 1/13/2025 6:19 PM, Vivek Sahu wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi Team,

Please include firmware bins for WCN6856.

Major contributions : Bug Fixes/Stability.

Snapshot of pull request is as below, let me know if anything is missing.

--------------------------------------------------------------------
The following changes since commit
ff68bad967033e2973d3a82e5b160813b1d43488:

  qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650
(2025-01-10 16:33:04 +0530)

are available in the Git repository at:

<a class="moz-txt-link-freetext" href="https://github.com/vivesahu-qcom/bt_hsp_fw.git">https://github.com/vivesahu-qcom/bt_hsp_fw.git</a> for/master

for you to fetch changes up to ff68bad967033e2973d3a82e5b160813b1d43488:

  qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650
(2025-01-10 16:33:04 +0530)

----------------------------------------------------------------


Thanks and regards,

Vivek K Sahu

</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------RVkLVGEEsR8PP5MQQSycR2oh--
