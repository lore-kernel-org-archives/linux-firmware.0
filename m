Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58245606A32A
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Oct 2026 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e9yYA3fe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDpsooBb
Received: by smtp.kernel.org (Postfix)
	id 492541F01828; Thu, 22 Oct 2026 17:51:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792691492;
	b=vUf6YYr/eNAltfO7Jshp7a0B1VlpxJcQrw94ZU8k8paHsRz9M0YCqKxhz/+8bE0rupLu
	 n9I62QAhrmcI4aWTmATOx6ugjXfSp1FNd5HJg+c4yb028u2ztQ0P6DcPpduLtK2AU5JFD
	 /PSmz2m258dj/HC3/uzSzp2zukkVOrWIXPkDqXsPjxTtLP+CgKDacbqCwym+GN6YSBWkP
	 OfRlnWL0wsQ63ZuZB28H9WBY77bkbIII0EeGiJPFuN2vrxQcp9KMA0F/pJa4e/fiet0YA
	 v1kty181xGHA0bEpw7wQuc0OFbV83ZjiBypm1LJHC82iYtMla7Qu3Vyb9UmDDaReSMg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792691492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:From:Content-Language:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=;
	b=c8ctKG89+Qg97YYAfvkwP8+jujdh3Hoth3IaQZturYnsjGkIHFjxqYIQmcXG1+2DUvTi
	 oIW/Huf7OnjGNNvVkIYkpBf5v1r+7cPmYFJdkTg6AXrHKk2upnPiE8eUNHoaCSPsvbQD2
	 iou1hwEfo65jPEcvZFvfzv6nZXxCrAoBqj1XkrhtjYa8dYkY0gDrbzAu3sYYjPNUIIzXB
	 D163UXkKqdAlThO7uyRSCVJSwdgg3gBHeJ0y43i4wCx+3WSmY6a+WnXyVvHkI8cPpV6Mi
	 4x+881cb0BzBfKqHCFwMkIMoaKWADBUUjuaxeWenpMVEgRaZdXivmSaUfeVNIKPkm9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e9yYA3fe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDpsooBb;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA19E1F01825
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 17:51:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e9yYA3fe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDpsooBb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BA19E1F01825
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFt4a2595452
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 17:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=; b=e9yYA3fe62mQ9SMv
	109TOAt2CaqagWfmRDafkPSXpaLh2XDwuoUibLZdVQ+DkDKoA1SYJQ5FvdOg4/jc
	gNHJjKENO9niTiRXo/efRTzbItq5KivpAQ4eKkB3K7ZxdyanwGu0ZQ42oL1aVsF/
	ridKCBUZJUuvqnJ1kUi1L189hdgBXjLMCGtQTL+lXaWtGG2NhhFAHdOgivosBhST
	zXVuH8C/Ia1bkr8c/nZsQMxKZYVSrlyq8864YuO3m4bcM6tAEic+X9Kyn1rO2qo5
	0GPeztI6ElRoJAbhsbVcuvGD1gEuO//YA4Kl5a0NyYwlzTuShRKpu7r3EATaAdLV
	U/x1IA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93amu60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 17:51:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso45558c88.0
        for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792691490; x=1793296290; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=;
        b=KDpsooBbO8T5aETfUlI6iWLILQjQCWptR02fuooGmjQcz2JVsDwFb+uqgf/+8s6Tny
         3/SEGcS3fQb8Ml53cEtENfyGfOoQds9sni+tUrclRrkRGwG7EgVxMKeP42CLLQtfAP31
         OJD0yjYYGLNws3vxCvNCTvSrjtnZLT/QPwxrCzbwqRoBG9LqQKMBJgdhEQ3pfI8/wfM1
         +9w5ghFLV5MgJGZIn9VU/5YsiGROBVKQNjowkbbMrPiH93WbG+vTqRdyTXRGjOCBJnLh
         48OmBMOrljG8UkQVrrUbO3DAlfn6wtyIkpbyX28WM/bjyImT6SLGTGtTeh6MVRXh4VVd
         ko7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691490; x=1793296290;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=;
        b=dR8a+WFZGuTIxNjVIEkmegDjT0L6j18hJbQxwBDuWR/UimUVRdIGse6yxIN6J4mwxr
         MBQ08QwD98uUDLhQ8OCkznqMX6wF4McXF6k8EHsTPphBQTymrrUwA2WTcTEH+A4koRFN
         gUNLLORmmSEhYWeodF+P5F4M2NyrURJaMk6VA2ktEuXzofKp3TWbcWwXzzWFsRz5NY+i
         H50MKJ/aJKPAZi6IdQveBcyQBP9lXw8yl+rPqBSNpvolcwGJG4wxfGM5MAX0MxaWLXU1
         T+enrJnaOSYFEx3DxWaZpMnocQGJjcEIZ9ZMN70qcSMogyExlnisGaHrLkltdMx7MjeD
         Z+gA==
X-Gm-Message-State: AFq9FYLa4L/owVcg8jhc7HfnOe/BvpTwMkketvBthsdKbmi/VZcoSY0c
	945LBCjmMDJ2QBxBadLJcv0ldLLxi4DdZ3FDF5T/0sGxQWep3depMGBsynVJCw5pbfqALdOBwHv
	1RQiYQjinTpZfQQTG8ZYpJpBtYGuwqqUFuWAd36osa8vwNRy/G/FAVPyOEDZKdv0=
X-Gm-Gg: AYBFou32PvYwKmeEvulGK3d+sDpEtUSE9NWIoUm8MkVhwHAtSWZAaYHZppe/QZnhIDn
	Fy655NR6LjqIIWQczbHuiKdLiR4fwRC1nN2kFnAQzmzz+/1Bk5Sp/iYIJFAXGH79C2eAospkoUe
	sXkMf6ro80CoZqwSx7c9jv7+bsosT22HDo7oyw+jR7f9jQFuq+7WImI9NoJYmKAkcOEz0B8qMrx
	7oSMNurMSeEZrGfd8+badULXR/WNWQL+1i/LsrRDwyWOn1UlGMl2VfbsUV8uTV0ZjQ54hih1LZ+
	vRe6UFLk4zNw/egGE/iayBS+StG64y/wzokUvH8ZPaDQCbQg+qC8hVqbxS0njwEOc+O5YTYAjvJ
	m5ZeLKbiGhvQbuOhvhjEZ8scc2Nf5pwtUbmK+fR9nwnS9kIeaj8kelg3ZBw==
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr244390c88.37.1792691490090;
        Thu, 22 Oct 2026 10:51:30 -0700 (PDT)
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr243809c88.37.1792691481288;
        Thu, 22 Oct 2026 10:51:21 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195aa59ab33sm140790c88.19.2026.10.22.10.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:51:20 -0700 (PDT)
Message-ID: <db682798-07c2-467f-809b-693615b9dcb8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:51:18 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261021
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
 <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX4y3oB9ROyT+e
 12swhm9LtpCSzwhQO6FiFSodTDL7lbdsV5F8/2s1Nb0JycCRFfaZLxakIOXZ7tXVbvj5ifmgLZw
 4y/CZI6KtmOWnDzXyKRxI2BgZ6QPEaOGoLDLk9h1mMW7ScUB4Ohi5h0AUNKvQ7ZbwaMU5SQzHds
 5BmF3RVHKnQoFeNJTd3m4bJHh/CG1ahbB3L70gmwAK9RXwVcLaFa/xNwGAFd6hOfWt5IchlqfSt
 flWMBwz84Q7nKMPrOYE7inOwUqURcVfB5jJb7jc0ckEhIEMl2/SV2ISnTqMELAOxNzz6+Cx9DSN
 5kQzcx+q1qxCyXl0Vu3rZr73AGTfP8+5IMwWom/nqEbEoPkJSm/JLBpSh0fn4U1m3dW/4tVH5Rl
 gejHdy/lHRyzqW63bBElQfM20vHxGQeS6K1JQ466+czxasJTrDkT+Q+W5Ir6AP72i2qubKNUTdf
 HaQd35LlwRf9I/Tzv/A==
X-Proofpoint-GUID: JEsQaik74R6LbmxQD4Rbs2JvM1xSxO6_
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada4d22 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8cXpSGzgMJdWOUynBhUA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: JEsQaik74R6LbmxQD4Rbs2JvM1xSxO6_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX0tYgXUnh98xi
 njmX7TYxtUxEuQOSJf8qlQTCXw1qVe+4Ecz67963fSLAOA/kSDIHvfvPF2wF0pOLta9mAlRH/eV
 ZVG/UzZ66PGHEscR5Msy8C0bhB+jrEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220071
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/2026 9:49 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 21, 2026 at 09:30:17AM -0700, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k firmware.
>>
>> There are no changes for ath11k or ath12k.
>>
>> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
>>
>> Please let me know if there are any problems.
> 
> "make check" failed:
> 
> 1. Missing "Signed-off-by: author information"
ACK, please drop. Updated PR issued.

/jeff
