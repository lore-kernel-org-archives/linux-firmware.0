Return-Path: <SRS0=R9/q=RT=quicinc.com=quic_vpuar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA928D2E010
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Oct 2024 03:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB68AC4CEE6; Wed, 23 Oct 2024 03:18:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FD89C4CEC3;
	Wed, 23 Oct 2024 03:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FD89C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLf0Qj003727;
	Wed, 23 Oct 2024 03:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3ShAYIb0lYc0vuU12Xm7RTw3
	uuQNSlB9u1zkkcZWtzs=; b=pBAh2ApP6oXfetYo+vZE4GDQeWtkfs+DtR/Hai83
	toaLm+/l1xIFWVjv21PRnfZ2Vo7WhZVWByiie9YhAt3CjruInT/cRVDBOV4aFOgy
	udZV4Hzs2z0sWIr2is0u6YMjJMuevhO/Nn886o0FiG2xuFcFBRBGrFMnjdx18RnQ
	wy1O70oi9nRlAhgilqwpzJjcWvlwF6d9CdqtNuSTmOB1EJPgKxaUd+7rzYgXbtWC
	+2PWM3pfVNc9XxIm/mdAbygSvpejiOZ7QdPIo7+KsMlfWcgVknB6gHidodp2m5yH
	bQr5/Mm8w0ePjE2M1G2knOQQaekvobefW6sQEGfipxHVdg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em680mcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 03:18:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N3IYiK006113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 03:18:34 GMT
Received: from [10.216.0.162] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 20:18:33 -0700
Content-Type: multipart/mixed;
	boundary="------------OH02bUc07FblTbVrFXOqN96X"
Message-ID: <84586ef0-9108-4fdd-b3b5-fd9d15710612@quicinc.com>
Date: Wed, 23 Oct 2024 08:48:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: check_whence.py: Add function to get listing of files
To: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
References: <56dd4ed2-a4a2-4d9d-b23b-2a817fca1f94@quicinc.com>
 <CA+5PVA65e_3w-gh-ZQPS8PDzxyPNZ_NNFcp7TcMhWi0pNO-x+g@mail.gmail.com>
 <CACvgo520miap4jYcKOgirscGzhZiM3TzrT8-18FTZ16gZ7ERhw@mail.gmail.com>
 <c37774af-29b0-4b5d-9793-78e976b8e81d@quicinc.com>
 <CACvgo511jG-4a6Ry1uTiSNHeaswMoXWDkDR6W7YQUT0yGL3mQg@mail.gmail.com>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <CACvgo511jG-4a6Ry1uTiSNHeaswMoXWDkDR6W7YQUT0yGL3mQg@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ro4xqINa_axk_utltoS4xB4V8uKTNanf
X-Proofpoint-GUID: Ro4xqINa_axk_utltoS4xB4V8uKTNanf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230017

--------------OH02bUc07FblTbVrFXOqN96X
Content-Type: multipart/alternative;
	boundary="------------srHy58Y6CavjHyocKpoGSMHu"

--------------srHy58Y6CavjHyocKpoGSMHu
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Attaching the patch here.

On 10/23/2024 2:29 AM, Emil Velikov wrote:
> On Tue, 22 Oct 2024 at 20:09, Vivek Puar<quic_vpuar@quicinc.com> wrote:
>> Hi,
>>
>> I've created another pull request, please review it.
>>
> Pull requests are not for reviewing but for merging code. They have no
> code to review.
> Please either post your patch or open a MR upstream.
>
> Thanks
> Emil

Regards,

Vivek

--------------srHy58Y6CavjHyocKpoGSMHu
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Attaching the patch here.<br>
    </p>
    <div class="moz-cite-prefix">On 10/23/2024 2:29 AM, Emil Velikov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACvgo511jG-4a6Ry1uTiSNHeaswMoXWDkDR6W7YQUT0yGL3mQg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Tue, 22 Oct 2024 at 20:09, Vivek Puar <a class="moz-txt-link-rfc2396E" href="mailto:quic_vpuar@quicinc.com">&lt;quic_vpuar@quicinc.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Hi,

I've created another pull request, please review it.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Pull requests are not for reviewing but for merging code. They have no
code to review.
Please either post your patch or open a MR upstream.

Thanks
Emil</pre>
    </blockquote>
    <p>Regards,</p>
    <p><span style="white-space: pre-wrap">Vivek
</span></p>
  </body>
</html>

--------------srHy58Y6CavjHyocKpoGSMHu--

--------------OH02bUc07FblTbVrFXOqN96X
Content-Type: text/plain; charset="UTF-8";
	name="0001-check_whence.py-Add-function-to-get-listing-of-files.patch"
Content-Disposition: attachment;
	filename*0="0001-check_whence.py-Add-function-to-get-listing-of-files.pa";
	filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzMDZkMDgxNTk0ZGY4YTQ0OWQwNzU2NTIxNzE1M2M0MGI2MTM2NjQ2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBWaXZlayBQdWFyIDxxdWljX3ZwdWFyQHF1aWNpbmMu
Y29tPgpEYXRlOiBXZWQsIDIzIE9jdCAyMDI0IDAwOjMyOjU3ICswNTMwClN1YmplY3Q6IFtQ
QVRDSF0gY2hlY2tfd2hlbmNlLnB5OiBBZGQgZnVuY3Rpb24gdG8gZ2V0IGxpc3Rpbmcgb2Yg
ZmlsZXMKCkNvbW1pdCBbMV0gaW50cm9kdWNlcyBjaGVja193aGVuY2UucHkgaW5zaWRlCmNv
cHktZmlybXdhcmUuc2ggYmVmb3JlIHRoZSBmaXJtd2FyZSBpcyBjb25zdW1lZC4KCkJ1dCBj
dXJyZW50IGNoZWNrX3doZW5jZS5weSBzdXBwb3J0cyBvbmx5IGdpdApyZXBvLCBhbmQgaXQg
d2lsbCBjYXVzZSBlcnJvciB3aGVuIGxpbnV4LWZpcm13YXJlIHRhcgppcyB1c2VkLCBhcyBp
dCB3aWxsIG5vdCBiZSBhIGdpdCByZXBvLgoKU28gYWRkaW5nIGEgY2hlY2sgdG8gcGFyc2Ug
bG9jYWwgZGlyZWN0b3J5IHRvIGNyZWF0ZQphIHNldCBvZiBmaWxlcyB0byB2YWxpZGF0ZSBp
dCB3aXRoIFdIRU5DRSBmaWxlLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC9jb21taXQv
P2lkPTZlZGQwZmQzNmFjYjkzYzgwNzViYmQ3MDBhZDkxZjUzZmM4MTBjMGUKClNpZ25lZC1v
ZmYtYnk6IFZpdmVrIFB1YXIgPHF1aWNfdnB1YXJAcXVpY2luYy5jb20+Ci0tLQogY2hlY2tf
d2hlbmNlLnB5IHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvY2hlY2tfd2hlbmNlLnB5IGIvY2hlY2tfd2hlbmNlLnB5CmluZGV4IDFmZWNl
NGY0Li4xZWE3NWE2OCAxMDA3NTUKLS0tIGEvY2hlY2tfd2hlbmNlLnB5CisrKyBiL2NoZWNr
X3doZW5jZS5weQpAQCAtMSw2ICsxLDYgQEAKICMhL3Vzci9iaW4vcHl0aG9uMwogCi1pbXBv
cnQgb3MsIHJlLCBzdGF0LCBzeXMKK2ltcG9ydCBvcywgcmUsIHN0YXQsIHN5cywgc3VicHJv
Y2VzcwogZnJvbSBpbyBpbXBvcnQgb3BlbgogCiAKQEAgLTYwLDEyICs2MCwyMSBAQCBkZWYg
bGlzdF9saW5rc19saXN0KCk6CiAKIAogZGVmIGxpc3RfZ2l0KCk6Ci0gICAgZ2l0X2ZpbGVz
ID0gb3MucG9wZW4oImdpdCBscy1maWxlcyIpCi0gICAgZm9yIGxpbmUgaW4gZ2l0X2ZpbGVz
OgotICAgICAgICB5aWVsZCBsaW5lLnJzdHJpcCgiXG4iKQorICAgIHRyeToKKyAgICAgICAg
c3VicHJvY2Vzcy5jaGVja19vdXRwdXQoWydnaXQnLCAncmV2LXBhcnNlJywgJy0taXMtaW5z
aWRlLXdvcmstdHJlZSddLCBzdGRlcnI9c3VicHJvY2Vzcy5TVERPVVQpCisgICAgICAgIHdp
dGggb3MucG9wZW4oImdpdCBscy1maWxlcyIpIGFzIGdpdF9maWxlczoKKyAgICAgICAgICAg
IGZvciBsaW5lIGluIGdpdF9maWxlczoKKyAgICAgICAgICAgICAgICB5aWVsZCBsaW5lLnJz
dHJpcCgiXG4iKQorICAgIGV4Y2VwdCBzdWJwcm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjoK
KyAgICAgICAgcmV0dXJuIE5vbmUKIAotICAgIGlmIGdpdF9maWxlcy5jbG9zZSgpOgotICAg
ICAgICBzeXMuc3RkZXJyLndyaXRlKCJXOiBnaXQgZmlsZSBsaXN0aW5nIGZhaWxlZCwgc2tp
cHBpbmcgc29tZSB2YWxpZGF0aW9uXG4iKQorCitkZWYgbGlzdF9kaXIoKToKKyAgICBwd2Qg
PSBvcy5nZXRjd2QoKQorICAgICMgUGFyc2UgZXZlcnkgZGlyZWN0b3J5IHRvIGNyZWF0ZSBz
ZXQgb2YgZmlsZXMgdG8gYmUgbWF0Y2hlZCB3aXRoIFdIRU5DRSBlbnRyaWVzCisgICAgZm9y
IHJvb3QsIGRpcnMsIGZpbGVzIGluIG9zLndhbGsocHdkKToKKyAgICAgICAgZm9yIGZpbGUg
aW4gZmlsZXM6CisgICAgICAgICAgICB5aWVsZCBvcy5wYXRoLnJlbHBhdGgob3MucGF0aC5q
b2luKHJvb3QsIGZpbGUucnN0cmlwKCJcbiIpKSwgcHdkKQogCiAKIGRlZiBtYWluKCk6CkBA
IC05Nyw3ICsxMDYsMTAgQEAgZGVmIG1haW4oKToKICAgICAgICAgXQogICAgICkKICAgICBr
bm93bl9wcmVmaXhlcyA9IHNldChuYW1lIGZvciBuYW1lIGluIHdoZW5jZV9saXN0IGlmIG5h
bWUuZW5kc3dpdGgoIi8iKSkKLSAgICBnaXRfZmlsZXMgPSBzZXQobGlzdF9naXQoKSkKKyAg
ICBmaWxlc19zZXQgPSBzZXQobGlzdF9naXQoKSkKKyAgICAjIElmIGl0IGlzIG5vdCBnaXQg
cmVwbyBjYWxsIGxpc3RfZGlyKCkKKyAgICBpZiBub3QgZmlsZXNfc2V0OgorICAgICAgICBm
aWxlc19zZXQgPSBzZXQobGlzdF9kaXIoKSkKICAgICBleGVjdXRhYmxlX2ZpbGVzID0gc2V0
KAogICAgICAgICBbCiAgICAgICAgICAgICAiYnVpbGRfcGFja2FnZXMucHkiLApAQCAtMTM4
LDEyICsxNTAsMTIgQEAgZGVmIG1haW4oKToKICAgICAgICAgICAgICkKICAgICAgICAgICAg
IHJldCA9IDEKIAotICAgIGZvciBuYW1lIGluIHNvcnRlZChsaXN0KGtub3duX2ZpbGVzIC0g
Z2l0X2ZpbGVzKSBpZiBsZW4oZ2l0X2ZpbGVzKSBlbHNlIGxpc3QoKSk6CisgICAgZm9yIG5h
bWUgaW4gc29ydGVkKGxpc3Qoa25vd25fZmlsZXMgLSBmaWxlc19zZXQpIGlmIGxlbihmaWxl
c19zZXQpIGVsc2UgbGlzdCgpKToKICAgICAgICAgc3lzLnN0ZGVyci53cml0ZSgiRTogJXMg
bGlzdGVkIGluIFdIRU5DRSBkb2VzIG5vdCBleGlzdFxuIiAlIG5hbWUpCiAgICAgICAgIHJl
dCA9IDEKIAogICAgICMgQSBsaW5rIGNhbiBwb2ludCB0byBhIGZpbGUuLi4KLSAgICB2YWxp
ZF90YXJnZXRzID0gc2V0KGdpdF9maWxlcykKKyAgICB2YWxpZF90YXJnZXRzID0gc2V0KGZp
bGVzX3NldCkKIAogICAgICMgLi4uIG9yIHRvIGEgZGlyZWN0b3J5CiAgICAgZm9yIHRhcmdl
dCBpbiBzZXQodmFsaWRfdGFyZ2V0cyk6CkBAIC0xNTQsMTQgKzE2NiwxNCBAQCBkZWYgbWFp
bigpOgogICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgICB2YWxpZF90YXJnZXRz
LmFkZChkaXJuYW1lKQogCi0gICAgZm9yIGxpbmssIHRhcmdldCBpbiBzb3J0ZWQobGlua3Nf
bGlzdCBpZiBsZW4oZ2l0X2ZpbGVzKSBlbHNlIGxpc3QoKSk6CisgICAgZm9yIGxpbmssIHRh
cmdldCBpbiBzb3J0ZWQobGlua3NfbGlzdCBpZiBsZW4oZmlsZXNfc2V0KSBlbHNlIGxpc3Qo
KSk6CiAgICAgICAgIGlmIHRhcmdldCBub3QgaW4gdmFsaWRfdGFyZ2V0czoKICAgICAgICAg
ICAgIHN5cy5zdGRlcnIud3JpdGUoCiAgICAgICAgICAgICAgICAgIkU6IHRhcmdldCAlcyBv
ZiBsaW5rICVzIGluIFdIRU5DRSBkb2VzIG5vdCBleGlzdFxuIiAlICh0YXJnZXQsIGxpbmsp
CiAgICAgICAgICAgICApCiAgICAgICAgICAgICByZXQgPSAxCiAKLSAgICBmb3IgbmFtZSBp
biBzb3J0ZWQobGlzdChnaXRfZmlsZXMgLSBrbm93bl9maWxlcykpOgorICAgIGZvciBuYW1l
IGluIHNvcnRlZChsaXN0KGZpbGVzX3NldCAtIGtub3duX2ZpbGVzKSk6CiAgICAgICAgICMg
SWdub3JlIHN1YmRpcmVjdG9yeSBjaGFuZ2Vsb2dzIGFuZCBHUEcgZGV0YWNoZWQgc2lnbmF0
dXJlcwogICAgICAgICBpZiBuYW1lLmVuZHN3aXRoKCIvQ2hhbmdlTG9nIikgb3IgKAogICAg
ICAgICAgICAgbmFtZS5lbmRzd2l0aCgiLmFzYyIpIGFuZCBuYW1lWzotNF0gaW4ga25vd25f
ZmlsZXMKQEAgLTE4Miw3ICsxOTQsNyBAQCBkZWYgbWFpbigpOgogICAgICAgICAgICAgc3lz
LnN0ZGVyci53cml0ZSgiRTogJXMgaXMgbWlzc2luZyBleGVjdXRlIGJpdFxuIiAlIG5hbWUp
CiAgICAgICAgICAgICByZXQgPSAxCiAKLSAgICBmb3IgbmFtZSBpbiBzb3J0ZWQobGlzdChn
aXRfZmlsZXMgLSBleGVjdXRhYmxlX2ZpbGVzKSk6CisgICAgZm9yIG5hbWUgaW4gc29ydGVk
KGxpc3QoZmlsZXNfc2V0IC0gZXhlY3V0YWJsZV9maWxlcykpOgogICAgICAgICBtb2RlID0g
b3Muc3RhdChuYW1lKS5zdF9tb2RlCiAgICAgICAgIGlmIHN0YXQuU19JU0RJUihtb2RlKToK
ICAgICAgICAgICAgIGlmIG5vdCAoCi0tIAoyLjM0LjEKCg==

--------------OH02bUc07FblTbVrFXOqN96X--
